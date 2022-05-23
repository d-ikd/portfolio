<template>
  <div>
    <v-app-bar :clipped-left="clipped" app color="#B0DFC1">
      <nuxt-link to="/" class="link">
        <v-toolbar-title class="header-title">Stuctive</v-toolbar-title>
      </nuxt-link>

      <v-spacer />
      <v-text-field
        v-model="searchForm"
        class="mt-6 mr-9 white--text"
        dense
        full-width
        clearable
        color="white"
        rounded
        outlined
        flat
        label="検索ワード"
        prepend-inner-icon="mdi-magnify"
      />

      <template v-if="!loggedIn">
        <v-btn
          text
          class="ml-4 mr-2 font-weight-bold"
          color="white"
          @click.stop="loginDialog(true)"
        >
          ログイン
        </v-btn>
        <v-dialog v-model="loginModal" max-width="600px" persistent>
          <the-modal-login />
        </v-dialog>
        <v-btn
          class="ml-4 mr-2 white--text font-weight-bold"
          color="#E2C6C7"
          @click.stop="signUpDialog(true)"
        >
          新規登録
        </v-btn>
        <v-dialog v-model="signUpModal" max-width="600px" persistent>
          <the-modal-sign-up />
        </v-dialog>
      </template>
      <template v-else>
        <dialog-component :is-account-page="true" class="mt-5" />
      </template>
    </v-app-bar>

    <!-- <dialog-component /> -->
    <v-row>
      <v-col sm="3" cols="12">
        <template v-if="search == '投稿'">
          <!-- <checkbox @category="catchCategory" /> -->
        </template>
      </v-col>
      <v-col sm="3" cols="12">
        <!--           <v-select v-model="search" :items="items" label="検索項目" /> -->
      </v-col>
    </v-row>
    <template v-if="search === '投稿' && resPosts.length">
      <schedule-card2 :posts="resPosts" />
    </template>
    <template v-else>
      <Schedule-card class="mr-4 ml-4" />
    </template>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
/* TheHeader */
import _debounce from 'lodash.debounce'
import theModalSignUp from '~/components/layouts/TheModalSignUp.vue'
import theModalLogin from '~/components/layouts/TheModalLogin.vue'
import dialogComponent from '~/components/layouts/DialogComponent.vue'

/* TheHeader */

/* import searchPost from '~/components/search/SearchPost.vue' */
import ScheduleCard2 from '~/components/search/ScheduleCard2.vue'
/* import checkbox from '~/components/search/Checkbox.vue' */
import ScheduleCard from '~/components/ScheduleCard.vue'

export default {
  components: {
    /* TheHeader */
    theModalSignUp,
    theModalLogin,
    dialogComponent,
    /* TheHeader */

    /* searchPost, */
    ScheduleCard2,

    /* checkbox, */
    ScheduleCard,
  },
  data() {
    return {
      clipped: true,
      loading: false,
      items: ['投稿', 'ユーザー'],
      category: [],
      searchForm: '',
      resPosts: [],
      resUsers: [],
    }
  },
  computed: {
    /* ========== ScheduleCard =========== */
    ...mapGetters({
      /* TheHeader */
      loggedIn: 'auth/isLoggedIn',
      loginModal: 'modal/loginModal',
      signUpModal: 'modal/signUpModal',
      /* TheHeader */

      posts: 'post/posts',
      // user: 'user/user',
      // loginUser: 'auth/loginUser',
    }),
    // postUpdate() {
    // return this.$store.state.post.post
    // },
    /* ========== ScheduleCard =========== */

    /* ========== Search =========== */
    search: {
      get() {
        return this.$store.state.tab.search
      },
      set(val) {
        this.$store.dispatch('tab/getSearch', val)
      },
    },
  },
  watch: {
    searchForm() {
      _debounce(this.resSearch, 500)()
    },
  },
  methods: {
    /* TheHeader */
    ...mapActions({
      loginDialog: 'modal/loginUser',
      signUpDialog: 'modal/signUpUser',
    }),
    link(link) {
      this.$router.push({ path: `/${link}` })
    },
    /* TheHeader */

    resSearch() {
      if (this.search === '投稿' && this.searchForm) {
        this.$axios
          .$get('api/v1/posts/search', {
            params: {
              search: this.searchForm,
            },
          })
          .then((res) => {
            this.resPosts = res
          })
          .catch((error) => {
            console.log(error)
          })
      } else if (this.search === 'ユーザー' && this.searchForm) {
        this.$axios
          .$get('api/v1/users/search', {
            params: {
              search: this.searchForm,
            },
          })
          .then((res) => {
            this.resUsers = res
          })
          .catch((error) => {
            console.log(error)
          })
      } else {
        this.resPosts = []
        this.resUsers = []
      }
    },
    catchCategory(category) {
      this.category = category
    },
  },
  /* ========== Search =========== */
}
</script>

<style scoped>
/* TheHeader */
.header-title {
  color: white;
  font-size: 40px;
  font-family: 'Fraunces', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
.link {
  text-decoration: none;
}
/* TheHeader */
</style>
