<template>
  <v-card class="ml-8 mr-8 mt-4 green lighten-3 rounded">
    <v-card flat class="green lighten-3">
      <v-row no-gutters>
        <v-col cols="12" sm="12">
          <v-row>
            <v-col>
              <v-sheet class="green lighten-3 d-flex align-center ">
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
                が {{ createDate }} に投稿

                <template
                  v-if="review.user_id === $store.state.auth.loginUser.id"
                >
                  <post-review-edit :review="review" />
                  <post-review-delete :review="review" />
                </template>

                <v-spacer />
                <div class="d-flex align-center" color="white">
                  <v-menu transition="scroll-x-transition">
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        color="white"
                        class="ma-2"
                        v-bind="attrs"
                        outlined
                        icon
                        v-on="on"
                      >
                        <v-icon>mdi-magnify</v-icon>
                      </v-btn>
                    </template>
                    <v-avatar size="500" class="radius-image">
                      <v-img
                        v-if="review.image.url"
                        :src="review.image.url"
                        alt="avatar"
                      />
                      <v-img v-else :src="defaultImage" contain />
                    </v-avatar>
                  </v-menu>

                  <!-- ====== いいねボタン======= -->
                  <v-btn
                    v-if="like"
                    color="red lighten-3 white--text"
                    class="ma-2"
                    icon
                    outlined
                    @click="nice"
                  >
                    <v-icon small class="mr-1"> mdi-heart-off </v-icon>
                  </v-btn>
                  <v-btn
                    v-else
                    color="white--text font-weight-bold"
                    class="mr-3 red lighten-1"
                    icon
                    outlined
                    @click="nice"
                  >
                    <v-icon> mdi-heart </v-icon>
                  </v-btn>
                  <!-- ====== いいねボタン======= -->
                  <div>
                    <user-dialog-like
                      :users="review.review_likes"
                      :title="'メッセージにいいねしたユーザー'"
                    />
                  </div>
                </div>
              </v-sheet>
            </v-col>
          </v-row>
        </v-col>
      </v-row>

      <v-row no-gutters>
        <v-col cols="12" sm="10">
          <h2 class="ma-3 font-weight-bold">{{ review.title }}</h2>
          <h3 class="review-content body-1 ml-5 ">{{ review.content }}</h3>
        </v-col>
        <v-col cols="12" sm="2">
          <!-- ========Message's Image======= -->
          <template v-if="review.image.url">
            <v-avatar size="100" class="radius-image mt-3 mb-3">
              <v-img
                v-if="review.image.url"
                :src="review.image.url"
                alt="avatar"
              />
              <v-img v-else :src="defaultImage" contain />
            </v-avatar>
          </template>

          <!--                     <template v-if="login">
                  </template> -->
          <!-- ========Message's Image======= -->
        </v-col>
      </v-row>
    </v-card>

    <!-- ======== Rating & Title ========= -->
    <!--     <div class="ml-4 d-flex align-center">
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
    </div> -->
    <!-- ======== Rating & Title ========= -->
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
.radius-image {
  border: 1px solid;
  border-radius: 20px;
  border-color: #bdbdbd;
}
.radius-big-image {
  border: 1px solid rgba(0, 0, 0.8);
  border-radius: 20px;
  border-color: #bdbdbd;
}
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
