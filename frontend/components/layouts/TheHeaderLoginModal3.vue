<template>
  <v-dialog v-model="dialog" width="500">
    <template v-slot:activator="{ on, attrs }">
      <v-btn color="red lighten-2" dark v-bind="attrs" v-on="on">
        Login Modal
      </v-btn>
    </template>

    <v-card>
      <v-card-title class="headline blue lighten-2">
        入力項目
      </v-card-title>

      <v-card-text>
        <v-form ref="form" v-model="isValid">
          <v-container>
            <v-text-field
              v-model="user.email"
              prepend-icon="mdi-email"
              label="メールアドレス"
              :rules="emailRules"
            />
            <!--
            v-model="user.email"
            :placeholder="emailForm.placeholder"
            -->

            <v-text-field
              v-model="user.password"
              prepend-icon="mdi-lock"
              :append-icon="toggle.icon"
              :type="toggle.type"
              :hide-details="noValidation"
              :rules="passwordRules.rules"
              :counter="!noValidation"
              label="パスワード"
              @click:append="show = !show"
              autocomplete="on"
              :hint="passwordRules.hint"
            />
            <!--
            v-model="user.password"
            :placeholder="passwordRules.placeholder"
             -->
          </v-container>
          <v-card-actions>
            <v-btn
              :disabled="!isValid"
              color="light-green darken-1"
              class="white--text pa-5 mt-3"
              block
              @click="loginUser"
            >
              ログイン
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
      <v-card-text class="text-center caption pb-5">
        <span class="signup-link" @click="guestLogin">
          ゲストユーザーでログイン
        </span>
      </v-card-text>
      <v-card-text class="text-center caption pb-5">
        アカウントをお持ちでないですか？
        <span class="signup-link" @click="signUpLink"> 新規登録 </span>
      </v-card-text>

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" text @click="dialog = false">
          I accept
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  data() {
    return {
      dialog: false,
      isValid: false,
      show: false,
      noValidation: true,
      user: {
        email: '',
        password: '',
      },
      guest: {
        email: 'guestuser4501@gmail.com',
        password: 'guestuser',
      },
      emailRules: [(v) => !!v || '', (v) => /.+@.+\..+/.test(v) || ''],
    }
  },
  computed: {
    emailForm() {
      const placeholder = this.noValidation ? undefined : 'your@email.com'
      return { placeholder }
    },
    passwordRules() {
      const min = '6文字以上'
      const msg = `${min}。半角英数字•ﾊｲﾌﾝ•ｱﾝﾀﾞｰﾊﾞｰが使えます`
      const required = (v) => !!v || ''
      const format = (v) => /^[\w-]{6,72}$/.test(v) || msg
      const rules = this.noValidation ? [required] : [format]
      const hint = this.noValidation ? undefined : msg
      const placeholder = this.noValidation ? undefined : min
      return { rules, hint, placeholder }
    },
    toggle() {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    },
  },
  methods: {
    ...mapActions({
      login: 'auth/login',
      loginDialog: 'modal/loginUser',
      signUpDialog: 'modal/signUpUser',
    }),
    loginUser() {
      this.login(this.user)
      this.loginDialog(false)
    },
    guestLogin() {
      this.login(this.guest)
      this.loginDialog(false)
    },
    signUpLink() {
      this.loginDialog(false)
      this.signUpDialog(true)
    },
  },
}
</script>
