<template>
  <div style="background-color: green">
    <v-parallax
      height="500"
      src="https://cdn.vuetifyjs.com/images/parallax/material2.jpg"
    >
      <div>
        <v-chip
          class="ma-5 font-weight-bold"
          color="blue-grey darken-2"
          label
          text-color="white"
        >
          {{ post.category }}
        </v-chip>
      </div>
      <div class="display-1 ma-16 font-weight-bold">
        {{ post.name }}
      </div>
    </v-parallax>

    <v-container class="pt-7 px-10">
      <template v-if="loading">
        <v-card flat style="background-color: blue">
          <p>作成日 : {{ createDate }}</p>

          <!-- ====気になるボタン==== -->
          <v-btn
            v-if="like"
            class="mx-5"
            color="red white--text font-weight-bold"
            @click="nice"
          >
            気になるを外す
          </v-btn>
          <v-btn
            v-else
            class="mx-5"
            color="green white--text font-weight-bold"
            @click="nice"
          >
            気になる！
          </v-btn>
          <!-- ====気になるボタン==== -->

          <div class="subtitle-1 mt-2 text-decoration-underline">
            {{ post.maker }}
          </div>

          <v-divider />
          <v-sheet style="background-color: pink">
            <v-row no-gutters>
              <v-col cols="12" sm="4">
                <v-img v-if="post.image.url" :src="post.image.url" contain />
                <v-img v-else :src="defaultImage" contain />
                <v-divider />

                <v-avatar size="50" class="mr-3 my-4 small-image">
                  <v-img
                    v-if="post.image.url"
                    :src="post.image.url"
                    alt="avatar"
                  />
                  <v-img v-else :src="defaultImage" contain />
                </v-avatar>

                <v-divider />
              </v-col>
              <v-col>
                <!-- ======== ハートレビュー ========= -->
                <div class="my-5 show-rate">
                  <span class="font-weight-bold"> また参加したい </span>
                  <v-rating
                    v-model="post.avg_rate"
                    empty-icon="mdi-heart-outline"
                    full-icon="mdi-heart"
                    background-color="orange lighten-1"
                    color="orange darken-2"
                    readonly
                    class="ml-5"
                    dense
                    large
                  />
                  <span class="ma-1 font-weight-bold">
                    {{ post.avg_rate }}
                  </span>
                </div>
                <!-- ======== ハートレビュー ========= -->

                <!-- ======== メッセージ＆気になる ========= -->
                <div>
                  メッセージ :
                  <user-dialog-review
                    :users="post.reviews"
                    :title="'メッセージしたユーザー'"
                  />
                  <br />
                  気になる :
                  <user-dialog
                    :users="post.like_users"
                    :title="'気になるユーザー'"
                  />
                </div>
                <!-- ======== メッセージ＆気になる ========= -->

                <v-divider />
                <div v-if="login" class="font-weight-bold my-5">
                  <!--
                    <v-btn
                      v-if="add"
                      color="red accent-3 white--text font-weight-bold"
                      @click="deleteMenu"
                    >
                      献立から外す
                    </v-btn>
                    <v-btn
                      v-else
                      color="indigo accent-3 white--text font-weight-bold"
                      @click="addMenu"
                    >
                      献立に追加
                    </v-btn> -->
                  <post-review-modal v-if="review" :post="post" />

                  <span>details: {{ post.details }}</span>
                  <hr />
                  <span>protein: {{ post.protein }}g</span>
                  <span>価格: {{ post.price }}円</span>
                  <span>カテゴリ: {{ post.category }}</span>
                  <a class="product-spec-link">maker: {{ post.maker }}</a>
                  <span>calorie: {{ post.calorie }}kcal</span>
                  <span>carbonhydrate: {{ post.carbonhydrate }}g</span>
                  <span>lipid: {{ post.lipid }}g</span>
                  <span v-if="post.release"
                    >releaseDate: {{ releaseDate }}</span
                  >
                  <span v-else>不明</span>
                </div>
              </v-col>
            </v-row>
          </v-sheet>
        </v-card>

        <!-- ======Post Message Container====== -->
        <v-divider class="mt-8" />
        <v-card flat style="background-color: orange">
          <v-row>
            <v-col>
              <v-card flat tile style="background-color: orange">
                <h3 class="show-info pl-2 mb-2">
                  メッセージ<span>（{{ post.reviews.length }}）</span>
                </h3>
                <!-- ======Post Messages====== -->
                <template v-if="post.reviews.length === 0">
                  <h4 class="ma-3 text-decoration-underline">
                    メッセージがありません。
                  </h4>
                  <post-review-modal v-if="login" :post="post" />
                </template>
                <template v-else>
                  <post-review-list :reviews="post.reviews" />
                </template>
                <!-- ======Post Messages====== -->
              </v-card>
            </v-col>
          </v-row>
        </v-card>
        <!-- ======Post Message Container====== -->
      </template>
    </v-container>
    <v-divider class="mb-8" />

    <postAlbum />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import postReviewModal from '~/components/infoPost/PostReviewModal.vue'
import postReviewList from '~/components/infoPost/PostReviewList.vue'
import userDialog from '~/components/infoUser/UserDialog.vue'
import userDialogReview from '~/components/infoUser/UserDialogReview.vue'
import postAlbum from '~/components/infoPost/PostAlbum.vue'

export default {
  name: 'RR',
  components: {
    postReviewModal,
    postReviewList,
    userDialogReview,
    userDialog,
    postAlbum,
  },
  data() {
    return {
      loading: false,
      like: false,
      review: true,
      add: false,
      createDate: '',
      releaseDate: '',
      defaultImage: require('@/assets/images/default-user.png'),
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      todayPosts: 'choise/posts',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
  },
  watch: {
    loginUserReview() {
      // ユーザーがすでにレビューを投稿してたら非表示にする
      if (this.login) {
        this.review = true
        this.post.reviews.forEach((f) => {
          if (f.user_id === this.user.id) {
            this.review = false
          }
        })
        this.add = false
        this.todayPosts.forEach((f) => {
          if (f.id === this.post.id) {
            this.add = true
          }
        })
      }
    },
  },
  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        // ユーザーがログインしてたらlikeしているか確認
        if (this.login) {
          this.post.like_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.like = true
            }
          })
          this.add = false
          this.todayPosts.forEach((f) => {
            if (f.id === this.post.id) {
              this.add = true
            }
          })
        }
        this.createDate = this.$dayjs(this.post.updated_at).format('YYYY/MM/DD')
        this.releaseDate = this.$dayjs(this.post.release).format('YYYY/MM/DD')
        this.loading = true
      })
  },
  methods: {
    ...mapActions({
      likePost: 'post/likePost',
      unLikePost: 'post/unLikePost',
      addPost: 'choise/addPost',
      deletePost: 'choise/deletePost',
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
    /*
    addMenu() {
      this.addPost(this.post)
      this.add = true
    },
    deleteMenu() {
      this.deletePost(this.post)
      this.add = false
    },*/
  },
}
</script>

<style scoped>
.small-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
.show-rate {
  font-size: 20px;
  font-weight: 200;
  display: flex;
  align-items: center;
}
.show-info {
  border-left: 3px solid;
  border-color: #2196f3;
}
.product-spec-list {
  border-bottom: 1px solid #e7e7e7;
  margin: 0;
}
.product-spec-term {
  display: inline-block;
  vertical-align: top;
  width: 105px;
  font-size: 15px;
  line-height: 16px;
  color: #999;
  font-weight: 500;
  margin: 12px 0 8px;
}
.product-spec-description {
  display: inline-block;
  vertical-align: top;
  font-size: 15px;
  line-height: 16px;
  letter-spacing: 0.4px;
  color: #2d2926;
  font-weight: 400;
  margin: 12px 0 8px;
  white-space: pre-wrap;
}
.product-spec-link {
  text-decoration: none;
  color: black;
  display: block;
  cursor: default;
  /* text-decoration: underline; */
}
</style>
