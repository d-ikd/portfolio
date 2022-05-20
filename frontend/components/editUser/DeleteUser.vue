<template>
  <v-form ref="form" lazy-validation class="ma-16">
    <v-icon> mdi-account-remove </v-icon>
    <span>アカウント削除</span><br />
    <v-card-actions class="justify-center">
      <v-btn
        v-if="email != guest"
        rounded
        color="error white--text"
        class="font-weight-bold mt-3"
        min-width="125px"
        @click="deleteUser"
      >
        削除
      </v-btn>
      <v-btn v-else color="grey" class="white--text px-10 mt-8">
        ゲストユーザーの為削除できません
      </v-btn>
    </v-card-actions>
  </v-form>
</template>

<script>
export default {
  data() {
    return {
      email: this.$store.getters['auth/currentUser'].uid,
      guest: process.env.RAILS_GUEST_ADDRESS,
    }
  },
  methods: {
    deleteUser() {
      this.$axios
        .delete('api/v1/auth', {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            uid: localStorage.getItem('uid'),
            client: localStorage.getItem('client'),
          },
        })
        .then((res) => {
          console.log(res)
          this.$store.commit('auth/setCurrentUser', {})
          this.$store.commit('auth/setLoginUser', {})
          this.$store.commit('auth/setIsLoggedIn', false)
          this.$store.dispatch(
            'snackbarMessage/showMessage',
            {
              message: 'ユーザーを削除しました',
              type: 'info',
              status: true,
            },
            { root: true }
          )
          this.$store.commit('choise/setDrawer', false)
          this.$store.dispatch('choise/deleteChoise')
          this.$router.push('/')
        })
        .catch(() => {
          this.$store.dispatch(
            'snackbarMessage/showMessage',
            {
              message: 'ユーザーの削除に失敗しました。',
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
