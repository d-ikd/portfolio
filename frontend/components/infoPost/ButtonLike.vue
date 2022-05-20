<template>
  <div>
    <template v-if="isRoundedLike">
      <v-btn
        v-if="isLike"
        color="red white--text font-weight-bold"
        absolute
        fab
        right
        top
        @click="nice"
      >
        <v-icon>mdi-heart-off</v-icon>
      </v-btn>
      <v-btn
        v-else
        color="pink white--text font-weight-bold"
        absolute
        fab
        right
        top
        @click="nice"
      >
        <v-icon>mdi-heart</v-icon>
      </v-btn>
    </template>
    <template v-if="isRoundedJoin">
      <v-btn
        v-if="isJoin"
        color="red white--text font-weight-bold"
        absolute
        fab
        right
        top
        @click="joining"
      >
        <v-icon large>mdi-run</v-icon>
      </v-btn>
      <v-btn
        v-else
        color="pink white--text font-weight-bold"
        absolute
        fab
        right
        top
        @click="joining"
      >
        <v-icon large>mdi-close-box</v-icon>
      </v-btn>
    </template>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
    user: {
      type: Object,
      required: true,
    },
    fronttitle: {
      type: String,
      required: false,
    },
    backtitle: {
      type: String,
      required: false,
    },
    isRoundedLike: {
      type: Boolean,
      default: false,
    },
    isRectangleLike: {
      type: Boolean,
      default: false,
    },
    isRoundedJoin: {
      type: Boolean,
      default: false,
    },
    isRectangleJoin: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      isLike: false,
      isJoin: false,
      loading: false,
      add: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      watchUser: 'user/user',
      watchPost: 'post/post',
    }),
    loginUserLike() {
      return this.$store.state.auth.loginUser
    },
  },
  watch: {
    loginUserLike() {
      if (this.login) {
        this.isLike = false
        this.loginUser.postlike.forEach((f) => {
          if (this.post.id === f.id) {
            this.isLike = true
          }
        })
      }
    },
    loginUserJoin() {
      if (this.login) {
        this.isJoin = false
        this.loginUser.postjoin.forEach((f) => {
          if (this.post.id === f.id) {
            this.isJoin = true
          }
        })
      }
    },
  },
  mounted() {
    if (this.login) {
      this.isLike = false
      this.loginUser.postlike.forEach((f) => {
        if (this.post.id === f.id) {
          this.isLike = true
        }
      })
    }
    if (this.login) {
      this.isJoin = false
      this.loginUser.postjoin.forEach((f) => {
        if (this.post.id === f.id) {
          this.isJoin = true
        }
      })
    }
  },
  // computed: {
  //   ...mapGetters({
  //     post: 'post/post',
  //     user: 'auth/loginUser',
  //     login: 'auth/isLoggedIn',
  //     currentPosts: 'favOrNotCheck/posts',
  //   }),
  //   loginUserReview() {
  //     return this.$store.state.post.post
  //   },
  // },

  methods: {
    ...mapActions({
      likePost: 'post/likePost',
      unLikePost: 'post/unLikePost',
      joinPost: 'post/joinPost',
      unJoinPost: 'post/unJoinPost',
    }),
    nice() {
      const postData = {
        user: this.loginUser.id,
        post: this.post.id,
      }
      if (this.isLike) {
        this.unLikePost(postData).then(() => {
          this.$axios.$get(`/api/v1/posts/${this.post.id}`).then((res) => {
            this.$store.commit('post/setPost', res, { root: true })
            this.isLike = false
          })
        })
      } else {
        this.likePost(postData).then(() => {
          this.$axios.$get(`/api/v1/posts/${this.post.id}`).then((res) => {
            this.$store.commit('post/setPost', res, { root: true })
            this.isLike = true
          })
        })
      }
    },
    joining() {
      const postData = {
        user: this.loginUser.id,
        post: this.post.id,
      }
      if (this.isJoin) {
        this.unJoinPost(postData).then(() => {
          this.$axios.$get(`/api/v1/posts/${this.post.id}`).then((res) => {
            this.$store.commit('post/setPost', res, { root: true })
            this.isJoin = false
          })
        })
      } else {
        this.joinPost(postData).then(() => {
          this.$axios.$get(`/api/v1/posts/${this.post.id}`).then((res) => {
            this.$store.commit('post/setPost', res, { root: true })
            this.isJoin = true
          })
        })
      }
    },
  },
}
</script>

<style scoped></style>
