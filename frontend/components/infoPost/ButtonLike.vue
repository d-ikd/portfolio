<template>
  <div>
    <!-- <v-btn
      v-if="like"
      absolute
      color="pink lighten-1"
      class="white--text"
      fab
      right
      top
    >
      <v-icon>mdi-heart-off</v-icon>
    </v-btn>
    <v-btn
      v-else
      absolute
      color="pink lighten-1"
      class="white--text"
      fab
      right
      top
    >
      <v-icon>mdi-heart</v-icon>
    </v-btn> -->
    <v-btn
      v-if="join"
      class="mx-5"
      color="red white--text font-weight-bold"
      outlined
      @click="joining"
    >
      <v-icon>mdi-heart-off</v-icon>
      {{ fronttitle }}
    </v-btn>
    <v-btn
      v-else
      class="mx-5"
      color="green white--text font-weight-bold"
      @click="joining"
    >
      <v-icon class="mr-1">mdi-heart</v-icon>
      {{ backtitle }}
    </v-btn>
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
    /*     status1: {
      type: String,
      required: false,
    },
    status2: {
      type: String,
      required: false,
    } */
  },
  data() {
    return {
      loading: false,
      like: false,
      join: false,
      add: false,
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
        user: this.user.id,
        post: this.post.id,
      }
      if (this.like) {
        this.unLikePost(postData).then(() => {
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
              this.like = false
            })
        })
      } else {
        this.likePost(postData).then(() => {
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
              this.like = true
            })
        })
      }
    },
    joining() {
      const postData = {
        user: this.user.id,
        post: this.post.id,
      }
      if (this.join) {
        this.unJoinPost(postData).then(() => {
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
              this.join = false
            })
        })
      } else {
        this.joinPost(postData).then(() => {
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
              this.join = true
            })
        })
      }
    },
  },
}
</script>

<style scoped></style>
