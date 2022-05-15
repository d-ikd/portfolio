<template>
  <v-form ref="form" lazy-validation class="ma-16">
    <v-icon> mdi-email-edit </v-icon>
    <span>メールアドレス</span>
    <v-text-field v-model="email" label="新しいメールアドレス" class="px-3" />
    <v-spacer></v-spacer>
    <v-btn
      v-if="originEmail != guest"
      rounded
      class="font-weight-bold"
      min-width="125px"
      color="#48A1EB"
      @click="changeUserEmail"
    >
      変更
    </v-btn>
    <v-btn v-else block color="grey" class="white--text">
      ゲストユーザーの為変更できません
    </v-btn>
  </v-form>
</template>

<script>
export default {
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
