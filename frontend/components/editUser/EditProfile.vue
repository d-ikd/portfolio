<template>
  <v-form ref="form" lazy-validation class="ma-16">
    <v-icon> mdi-account-edit </v-icon>
    <span>ユーザー名</span>
    <v-text-field v-model="name" label="新しいニックネーム" class="px-3" />
    <v-icon> mdi-account-details </v-icon>
    <span>プロフィール</span>
    <v-textarea v-model="profile" label="プロフィール" class="px-3" />
    <v-card-actions class="justify-center">
      <button-change @button-action="changeUserProfile" />
    </v-card-actions>
  </v-form>
</template>

<script>
import buttonChange from '~/components/layouts/ButtonChange.vue'

export default {
  components: {
    buttonChange,
  },
  data() {
    return {
      name: this.$store.getters['auth/currentUser'].name,
      profile: this.$store.getters['auth/currentUser'].profile,
    }
  },
  methods: {
    async changeUserProfile() {
      const formData = new FormData()
      formData.append('name', this.name)
      formData.append('profile', this.profile)
      await this.$axios
        .put('api/v1/auth', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log(res)
          this.$store.commit('auth/setCurrentUser', res.data.data)
          this.$store.dispatch(
            'snackbarMessage/showMessage',
            {
              message: 'ユーザープロフィールを更新しました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch(() => {
          this.$store.dispatch(
            'snackbarMessage/showMessage',
            {
              message: 'プロフィールの更新に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        })
    },
  },
}
</script>
