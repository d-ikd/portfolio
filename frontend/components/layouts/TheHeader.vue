<template>
  <v-app-bar :clipped-left="clipped" app dark>
    <nuxt-link to="/" class="link">
      <v-toolbar-title class="header-title">Stuctive</v-toolbar-title>
    </nuxt-link>

    <v-spacer />

    <template v-if="!loggedIn">
      <v-btn
        text
        class="ml-4 mr-2 font-weight-bold"
        @click.stop="loginDialog(true)"
      >
        ログイン
      </v-btn>
      <v-dialog v-model="loginModal" max-width="600px" persistent>
        <the-modal-login />
      </v-dialog>
      <v-btn
        class="ml-4 mr-2"
        color="green  white--text font-weight-bold"
        @click.stop="signUpDialog(true)"
      >
        新規登録
      </v-btn>
      <v-dialog v-model="signUpModal" max-width="600px" persistent>
        <the-modal-sign-up />
      </v-dialog>
    </template>
    <template v-else>
      <the-header-account-setting />
    </template>
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import theHeaderAccountSetting from '~/components/layouts/TheHeaderAccountSetting.vue'
import theModalSignUp from '~/components/layouts/TheModalSignUp.vue'
import theModalLogin from '~/components/layouts/TheModalLogin.vue'

export default {
  components: {
    theHeaderAccountSetting,
    theModalSignUp,
    theModalLogin,
  },
  data() {
    return {
      clipped: true,
      drawer: null,
      fixed: true,
      links: [{ to: '/users/signup' }, { to: '/users/login' }],
    }
  },
  computed: {
    ...mapGetters({
      loggedIn: 'auth/isLoggedIn',
      loginModal: 'modal/loginModal',
      signUpModal: 'modal/signUpModal',
    }),
  },
  methods: {
    ...mapActions({
      loginDialog: 'modal/loginUser',
      signUpDialog: 'modal/signUpUser',
    }),
    link(link) {
      this.$router.push({ path: `/${link}` })
    },
  },
}
</script>

<style scoped>
.header-title {
  color: white;
  font-size: 40px;
  font-family: 'Fraunces', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
.link {
  text-decoration: none;
}
</style>
