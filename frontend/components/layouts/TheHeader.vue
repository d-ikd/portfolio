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
        <login-modal />
      </v-dialog>
      <v-btn
        class="ml-4 mr-2"
        color="green  white--text font-weight-bold"
        @click.stop="signUpDialog(true)"
      >
        新規登録
      </v-btn>
      <v-dialog v-model="signUpModal" max-width="600px" persistent>
        <sign-up-modal />
      </v-dialog>
    </template>
    <template v-else>
      <header-avatar />
    </template>
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import headerAvatar from '~/components/HeaderAvatar.vue'
import signUpModal from '~/components/layouts/SignUpModal.vue'
import loginModal from '~/components/layouts/LoginModal.vue'

export default {
  components: {
    headerAvatar,
    signUpModal,
    loginModal,
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
    pagelink(link) {
      if (link == '/ranking') {
        this.$store.dispatch('tab/getRankingTab', 0)
      } else if (link == '/food/new') {
        this.$store.dispatch('tab/getNewTab', 0)
      }
    },
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
