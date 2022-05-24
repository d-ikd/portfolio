<template>
  <v-card class="pa-2">
    <div class="d-flex align-center">
      <nuxt-link :to="{ path: `/post/${review.post.id}` }">
        <v-avatar size="50" class="mr-3 my-4 small-image">
          <v-img
            v-if="review.post.image.url"
            :src="review.post.image.url"
            alt="avatar"
            contain
          />
          <v-img v-else :src="defaultImage" contain />
        </v-avatar>
      </nuxt-link>
      <nuxt-link :to="{ path: `/post/${review.post.id}` }">
        <span class="ml-2 body-2 black--text">
          {{ review.post.name }}
        </span>
      </nuxt-link>
    </div>
    <div class="d-flex align-center">
      <span class="ml-2 subtitle-1 font-weight-bold">
        {{ review.title }}
      </span>
    </div>
    <p class="review-content body-1 my-1">
      {{ review.content }}
    </p>
    <template v-if="review.image.url">
      <v-img
        :src="review.image.url"
        contain
        max-width="200px"
        max-height="200px"
      />
    </template>
    <div class="d-flex align-center my-2">
      <v-spacer />
      <p class="review-content caption">投稿日: {{ createDate }}</p>
    </div>
  </v-card>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
/* import theModalMessageEdit from '~/components/layouts/TheModalMessageEdit.vue' */
/* import postReviewDelete from '~/components/infoPost/PostReviewDelete.vue' */

export default {
  components: {
    /* theModalMessageEdit, */
    /* postReviewDelete, */
  },
  props: {
    review: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      createDate: '',
      expand: false,
      defaultImage: require('@/assets/images/default.png'),
      like: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserReview() {
      return this.$store.state.user.user
    },
  },
  watch: {
    loginUserReview() {
      if (this.login) {
        this.like = false
        this.review.review_likes.forEach((f) => {
          if (f.user_id === this.loginUser.id) {
            this.like = true
          }
        })
      }
    },
  },
  mounted() {
    this.createDate = this.$dayjs(this.review.created_at).format('YYYY/MM/DD')
    if (this.login) {
      this.like = false
      this.review.review_likes.forEach((f) => {
        if (f.user_id === this.loginUser.id) {
          this.like = true
        }
      })
    }
  },
  methods: {
    ...mapActions({
      likeReview: 'review/likeReview',
      unLikeReview: 'review/unLikeReview',
    }),
    nice() {
      const postData = {
        user: this.$store.state.auth.loginUser.id,
        review: this.review.id,
      }
      if (this.like) {
        this.unLikeReview(postData).then(() => {
          this.like = false
          this.$axios
            .$get(`/api/v1/users/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
            })
        })
      } else {
        this.likeReview(postData).then(() => {
          this.like = true
          this.$axios
            .$get(`/api/v1/users/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
            })
        })
      }
    },
  },
}
</script>

<style scoped>
.review-content {
  margin-bottom: 0px;
}
.small-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
.small-image:hover {
  opacity: 0.7;
}
</style>
