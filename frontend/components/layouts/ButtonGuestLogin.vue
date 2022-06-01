<template>
  <v-card>
    <v-system-bar lights-out>
      <v-spacer></v-spacer>
      <v-btn icon class="mt-6" large @click="guestLogin">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-system-bar>
  </v-card>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  data() {
    return {
      isValid: false,
      show: false,
      noValidation: true,
      user: {
        email: '',
        password: '',
      },
      guest: {
        email: 'guestuser20220106@gmail.com',
        password: 'guestuser',
      },
      emailRules: [(v) => !!v || '', (v) => /.+@.+\..+/.test(v) || ''],
    }
  },
  computed: {
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

<style scoped>
.signup-link {
  color: #2196f3;
  cursor: pointer;
}
.signup-link:hover {
  opacity: 0.8;
  text-decoration: underline;
}
</style>
