<template>
  <v-app-bar :clipped-left="clipped" app dark>
    <div>
      <TheHeaderLogo />
    </div>
    <div>
      <TheHeaderTabs />
    </div>
    <div class="text-center">
      <v-spacer />
      <template v-if="!loggedIn">
        <v-btn
          text
          x-large
          class="ml-4 mr-2 font-weight-bold"
          @click.stop="loginDialog(true)"
        >
          Login
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
    </div>
  </v-app-bar>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import headerAvatar from '~/components/layouts/TheHeaderAvatar.vue'
import signUpModal from '~/components/layouts/TheHeaderModalSignup.vue'
import loginModal from '~/components/layouts/TheHeaderModalLogin.vue'
import TheHeaderTabs from '~/components/layouts/TheHeaderTabs.vue'
import TheHeaderLogo from '~/components/layouts/TheHeaderLogo.vue'
export default {
  components: {
    headerAvatar,
    signUpModal,
    loginModal,
    TheHeaderLogo,
    TheHeaderTabs,
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
    // pagelink(link) {
    //   if (link == "/ranking") {
    //     this.$store.dispatch("tab/getRankingTab", 0)
    //   } else if (link == "/food/new") {
    //     this.$store.dispatch("tab/getNewTab", 0)
    //   }
    // },
    link(link) {
      this.$router.push({ path: `/${link}` })
    },
  },
}
</script>

<style scoped>
.header-title {
  color: white;
  font-size: 35px;
  font-family: 'Fraunces', serif;
}
.link {
  text-decoration: none;
}
</style>
