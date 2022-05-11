<template>
  <v-form ref="form" lazy-validation class="ma-16">
    <v-icon> mdi-email-edit </v-icon>
    <span>パスワード変更</span>
    <v-text-field
      v-model="pas.password"
      label="変更後パスワード"
      class="px-3"
      :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
      :type="show1 ? 'text' : 'password'"
      @click:append="show1 = !show1"
    />
    <v-text-field
      v-model="pas.password_confirmation"
      label="変更後パスワード(再入力)"
      class="px-3"
      :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
      :type="show2 ? 'text' : 'password'"
      @click:append="show2 = !show2"
    />
    <v-btn
      v-if="email != guest"
      rounded
      color="#48A1EB"
      min-width="125px"
      class="font-weight-bold"
      @click="changeUserPassword"
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
      show1: false,
      show2: false,
      pas: {
        password: '',
        password_confirmation: '',
      },
      email: this.$store.getters['auth/currentUser'].uid,
      guest: 'guestuser20220106@gmail.com',
    }
  },
  methods: {
    changeUserPassword() {
      this.$axios
        .put('api/v1/auth/password', this.pas, {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            uid: localStorage.getItem('uid'),
            client: localStorage.getItem('client'),
          },
        })
        .then((res) => {
          console.log(res)
          this.$store.dispatch(
            'flashMessage/showMessage',
            {
              message: 'パスワードを更新しました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
          this.$router.push('/')
        })
        .catch(() => {
          this.$store.dispatch(
            'flashMessage/showMessage',
            {
              message: 'パスワードの更新に失敗しました。',
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
