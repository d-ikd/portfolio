<template>
  <v-card class="ml-4 mr-4 mt-4 " color="#26c6da">
    <div class="d-flex align-center" color="white">
      <nuxt-link :to="{ path: `/users/${review.user_id}` }">
        <user-avatar :size="50" :user="review.user" />
      </nuxt-link>
      <v-btn
        class="ma-1"
        plain
        style="text-transform: none"
        nuxt
        :to="`/users/${review.user_id}`"
      >
        {{ review.user.name }}
      </v-btn>
      <!--
        <nuxt-link :to="{ path: `/users/${review.user_id}` }">
          <span>
            {{ review.user.name }}
          </span>
      </nuxt-link>
-->

      <v-spacer />
      <template v-if="review.user_id === $store.state.auth.loginUser.id">
        <post-review-edit :review="review" />
        <post-review-delete :review="review" />
      </template>
    </div>

    <!-- ======== Rating & Title ========= -->
    <div class="ml-4 d-flex align-center">
      <v-rating
        v-model="rating"
        empty-icon="mdi-heart-outline"
        full-icon="mdi-heart"
        background-color="orange lighten-1"
        color="orange darken-2"
        readonly
        dense
        small
      />
      <span class="ml-2 subtitle-1 font-weight-bold">{{ review.title }}</span>
    </div>
    <!-- ======== Rating & Title ========= -->

    <!-- ======== Content in Message ========= -->
    <p class="review-content body-1 ml-5">
      {{ review.content }}
    </p>
    <!-- ======== Content in Message ========= -->

    <!-- ========Message's Image======= -->
    <template v-if="review.image.url">
      <v-btn
        text
        small
        color="blue"
        class="font-weight-bold"
        @click="expand = !expand"
      >
        画像を表示
      </v-btn>
      <v-expand-transition>
        <v-img
          v-show="expand"
          :src="review.image.url"
          contain
          max-width="200px"
          max-height="200px"
        />
      </v-expand-transition>
    </template>
    <!-- ========Message's Image======= -->

    <div class="d-flex align-center ml-4 mb-2 mt-2">
      <template v-if="login">
        <!-- ====== いいねボタン======= -->
        <v-btn
          v-if="like"
          color="red lighten-3 white--text font-weight-bold"
          class="mr-3"
          small
          @click="nice"
        >
          <v-icon small class="mr-1"> mdi-heart-off </v-icon>
          いいねから外す
        </v-btn>
        <v-btn
          v-else
          color="pink white--text font-weight-bold"
          class="mr-3"
          small
          @click="nice"
        >
          <v-icon small class="mr-1"> mdi-heart-plus </v-icon>
          いいね！
        </v-btn>
        <!-- ====== いいねボタン======= -->

        <div>
          <user-dialog-like
            :users="review.review_likes"
            :title="'メッセージにいいねしたユーザー'"
          />
        </div>
        <!-- <v-btn
          color="cyan white--text font-weight-bold"
          class="ml-5 mr-3"
          small
        >
          <v-icon small class="mr-1"> mdi-comment-multiple </v-icon>
          コメント
          <span class="ml-1">(5)</span>
        </v-btn> -->
      </template>
      <v-spacer />
      <p class="review-content caption mr-2">投稿日: {{ createDate }}</p>
    </div>
  </v-card>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import postReviewEdit from '~/components/infoPost/PostReviewEdit.vue'
import postReviewDelete from '~/components/infoPost/PostReviewDelete.vue'
import userDialogLike from '~/components/infoUser/UserDialogLike.vue'

export default {
  components: {
    userAvatar,
    postReviewEdit,
    postReviewDelete,
    userDialogLike,
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
      rating: this.review.rate,
      expand: false,
      like: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
  },
  watch: {
    loginUserReview() {
      // レビューにlike済みか確認
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
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
            })
        })
      } else {
        this.likeReview(postData).then(() => {
          this.like = true
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
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
.arrow_box {
  position: relative;
  border: 1px solid black;
  padding: 5px 7px;
  color: #39c !important;
  text-decoration: underline !important;
  border-radius: 3px;
}
.arrow_box:after,
.arrow_box:before {
  right: 100%;
  top: 50%;
  border: solid transparent;
  content: '';
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}

.arrow_box:after {
  border-color: rgba(136, 183, 213, 0);
  border-right-color: white;
  border-width: 6px;
  margin-top: -6px;
}
.arrow_box:before {
  border-color: rgba(194, 225, 245, 0);
  border-right-color: black;
  border-width: 7px;
  margin-top: -7px;
}
</style>
