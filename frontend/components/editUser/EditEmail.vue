<template>
  <v-form ref="form" lazy-validation class="ma-16">
    <v-icon> mdi-email-edit </v-icon>
    <span>メールアドレス</span>
    <v-text-field v-model="email" label="新しいメールアドレス" class="px-3" />
    <v-spacer></v-spacer>
    <v-card-actions class="justify-center">
      <template v-if="originEmail != guest">
        <button-change @button-action="changeUserEmail" />
      </template>
      <template v-else>
        <v-btn block color="grey" class="white--text">
          ゲストユーザーの為変更できません
        </v-btn>
      </template>
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
      email: this.$store.getters['auth/currentUser'].email,
      originEmail: this.$store.getters['auth/currentUser'].uid,
      guest: 'guestuser20220106@gmail.com',
    }
  },
  methods: {
    async changeUserEmail() {
      const formData = new FormData()
      formData.append('email', this.email)
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
              message: 'メールアドレスを更新しました。',
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
              message: 'メールアドレスの更新に失敗しました。',
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
