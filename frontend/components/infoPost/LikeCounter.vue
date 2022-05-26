<template>
  <v-dialog
    v-model="dialogComponent"
    hide-overlay
    transition="dialog-bottom-transition"
    max-width="600"
    persistent
  >
    <template #activator="{ on, attrs }">
      <span v-bind="attrs" v-on="on">
        <p class="blue--text d-flex">
          <!-- <template v-if="icon">
            <v-icon>mdi-heart</v-icon>&nbsp;{{ post.like_users.name }}
          </template> -->
          <template>
            <v-icon>mdi-run</v-icon>&nbsp;{{
              post.join_users.length
            }}&nbsp;<span class="white--text">/&nbsp;{{ post.member }} </span>
          </template>
        </p>
      </span>
    </template>

    <v-row no-gutters>
      <v-col> </v-col>
      <v-col cols="sm" class="text-center align-self-center">
        <v-sheet elevation="4" class="rounded-pill">
          <template>
            <v-chip
              label
              color="transparent"
              x-large
              outlined
              text-color="purple"
            >
              <v-icon class="ml-2 mr-2">mdi-account-circle</v-icon>
              アカウント
            </v-chip>
          </template>
        </v-sheet>
      </v-col>
      <v-col>
        <template>
          <v-card-title class="transparent white--text">
            <span class="headline"></span>

            <v-spacer></v-spacer>

            <v-menu bottom left>
              <template v-slot:activator="{ attrs }">
                <v-btn
                  color="#BDBDBD88"
                  fab
                  dark
                  x-large
                  v-bind="attrs"
                  @click="closeDialog"
                >
                  <v-icon color="white"> mdi-close-circle-outline</v-icon>
                </v-btn>
              </template>
            </v-menu>
          </v-card-title>
        </template>
      </v-col>
    </v-row>

    <v-sheet
      width="500px"
      color="transparent"
      class=" mx-auto pb-3 mb-10 rounded-card"
    >
      <v-list rounded color="white">
        <v-subheader class="black--text"
          >{{ title }}（{{ users.length }}）</v-subheader
        >
        <v-list-item-group>
          <v-list-item
            v-for="user in users"
            :key="user.id"
            :ripple="false"
            class="list"
          >
            <nuxt-link :to="{ path: `/users/${user.id}` }">
              <user-avatar :size="45" :user="user" class="list-avatar mx-3" />
            </nuxt-link>
            <v-list-item-content>
              <v-list-item-title
                class="black--text list-item"
                @click="pagelink(user.id)"
              >
                {{ user.name }}
              </v-list-item-title>
            </v-list-item-content>
            <user-follow :user="user" />
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-sheet>
  </v-dialog>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userFollow from '~/components/infoUser/UserFollow.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'

export default {
  components: {
    userAvatar,
    userFollow,
    buttonClose,
  },
  props: {
    users: {
      type: Array,
      required: true,
    },
    post: {
      type: Object,
      default: () => ({}),
      required: true,
    },
    ppp: {
      type: Object,
      default: () => ({}),
      required: false,
    },

    title: {
      type: String,
      required: true,
    },
    icon: {
      type: Boolean,
      required: false,
    },
  },
  data() {
    return {
      dialog: false,
      likeList: [],
    }
  },
  methods: {
    closeDialog() {
      this.dialog = false
    },
  },
  computed: {
    postUpdate() {
      return this.$store.state.post.post
    },
    /*      likeCount() {
      return this.post.like_users.length
    }, */
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
    }),
    /*
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },
  watch: {
    postUpdate() {
      // POST再取得時にユーザーを更新
      this.$axios.get(`api/v1/posts/${this.$post.id}`).then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
        console.log(res.data)
      })
    },
    postUpdate() {
      // POST再取得時にユーザーを更新
      this.$axios.get(`api/v1/users/${this.$post.id}`).then((res) => {
        this.$store.commit('user/setUser', res.data, { root: true })
        console.log(res.data)
      })
    },
    // userUpdate() {
    //   // ユーザー情報更新時にユーザーを更新
    //   this.$axios.get(`api/v1/users/${this.$route.params.id}`).then((res) => {
    //     this.$store.commit("user/setUser", res.data, { root: true })
    //     console.log(res.data)
    //   })
    // }, */
    /*
  watch: {
    count() {
      return this.post.like_users.length
    },
  },
  mounted() {
      return this.post.like_users.length
  },
    },
    // ログインユーザが既にいいねしているかを判定する
  //   isLiked() {
  //     if (this.likeList.length === 0) {
  //       return false
  //     }
  //     return Boolean(this.findLikeId())
  //   },
  // }, */
    /*
methods: {
      pagelink(link) {
      this.$router.push({ path: `/users/${link}` })
    }, */
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
</style>
