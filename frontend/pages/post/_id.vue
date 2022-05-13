<template>
  <div style="background-color: white">
    <v-parallax :src="post.image.url" height="100%">
      <!-- "post.image.url" -->
      <!-- .$get(`/api/v1/posts/${this.$route.params.id}`) -->
      <div align="right">
        <v-chip
          class="ma-5 font-weight-bold"
          color="blue-grey darken-2"
          label
          text-color="white"
        >
          {{ post.category }}
        </v-chip>
      </div>
      <span v-if="post.release">test</span>

      <div class="display-1 ma-16 font-weight-bold">
        {{ post.name }}
      </div>
    </v-parallax>
    <v-card align="right" justify="end"> </v-card>

    <v-img v-if="post.image.url" :src="post.image.url" contain />
    <v-img v-else :src="defaultImage" contain />

    <v-container class="pt-7 px-10">
      <template v-if="loading">
        <v-card flat>
          <v-row no-gutters>
            <v-col cols="12" sm="6">
              <v-row>
                <v-col>
                  <v-card-title class="pa-2 purple lighten-3">
                    <v-avatar>
                      <v-img
                        src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light"
                      ></v-img>
                    </v-avatar>
                    <div>
                      {{ createDate }} に <br />
                      {{ user.name }} さんが投稿しました。
                    </div>
                  </v-card-title>

                  <v-card>
                    <v-card-text class="py-0">
                      {{ post.details }}
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>
            </v-col>
            <v-col>
              <v-divider />

              <v-card flat style="background-color: orange">
                <v-row>
                  <v-col>
                    <v-card flat tile style="background-color: orange">
                      <h3 class="pl-2 mb-2">メッセージ</h3>
                      <!-- ======Post Messages====== -->
                      <h4 class="ma-3 text-decoration-underline">
                        メッセージがありません。
                      </h4>
                      <!-- ======Post Messages====== -->
                    </v-card>
                  </v-col>
                </v-row>
              </v-card>

              <v-card>
                <v-card-text class="py-0">
                  <v-timeline align-top dense>
                    <v-timeline-item color="teal lighten-3" small>
                      <v-row class="pt-1">
                        <v-col cols="3">
                          <strong>集合: {{ start_time }}</strong>
                        </v-col>
                        <v-col>
                          <strong
                            >場所: {{ post.place }} / 募集メンバー:
                            {{ post.member }}人</strong
                          >
                          <div class="caption mb-2">
                            予算: {{ post.price }}円/人
                          </div>
                          <v-avatar>
                            <v-img
                              src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light"
                            ></v-img>
                          </v-avatar>
                          <v-avatar>
                            <v-img
                              src="https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned"
                            ></v-img>
                          </v-avatar>
                          <v-avatar>
                            <v-img
                              src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairMiaWallace&accessoriesType=Sunglasses&hairColor=BlondeGolden&facialHairType=Blank&clotheType=BlazerSweater&eyeType=Surprised&eyebrowType=RaisedExcited&mouthType=Smile&skinColor=Pale"
                            ></v-img>
                          </v-avatar>
                        </v-col>
                      </v-row>
                    </v-timeline-item>
                    <v-timeline-item color="pink" small>
                      <v-row class="pt-1">
                        <v-col cols="3">
                          <strong>終了: {{ finish_time }}</strong>
                        </v-col>
                        <v-col>
                          <strong>New Icon</strong>
                          <div class="caption">
                            Mobile App
                          </div>
                        </v-col>
                      </v-row>
                    </v-timeline-item>
                  </v-timeline>
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>

          <v-row no-gutters>
            <v-col cols="12" sm="6">
              <!-- ====気になるボタン==== -->
              <div align="center" justify="end">
                <v-btn
                  v-if="like"
                  class="mx-5"
                  color="red white--text font-weight-bold"
                  @click="nice"
                >
                  <v-icon>mdi-heart-off</v-icon>
                  「気になる」から外す
                </v-btn>
                <v-btn
                  v-else
                  class="mx-5"
                  color="green white--text font-weight-bold"
                  @click="nice"
                >
                  <v-icon>mdi-heart</v-icon>
                  気になる！
                </v-btn>
              </div>
              <!-- ====気になるボタン==== -->
            </v-col>
            <v-col>
              <!-- ====Join ボタン==== -->
              <div align="center" justify="end" class="mt5">
                <v-btn
                  v-if="join"
                  class="mx-5"
                  color="red white--text font-weight-bold"
                  @click="joining"
                >
                  <v-icon>mdi-close-circle-outline</v-icon>
                  「参加する」から外す
                </v-btn>
                <v-btn
                  v-else
                  class="mx-5"
                  color="green white--text font-weight-bold"
                  @click="joining"
                >
                  参加する！
                  <v-icon>mdi-walk</v-icon>
                </v-btn>
              </div>
              <!-- ====Join ボタン==== -->
            </v-col>
          </v-row>
        </v-card>

        <!-- ======Post Message Container====== -->
        <v-divider class="mt-8" />
        <v-card flat style="background-color: orange">
          <v-row>
            <v-col>
              <v-card flat tile style="background-color: orange">
                <h3 class="pl-2 mb-2">
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

    <!-- ======== メッセージ＆気になる ========= -->
    <div>
      メッセージ :
      <user-dialog-review
        :users="post.reviews"
        :title="'メッセージしたユーザー'"
      />
      <br />
      気になる :
      <user-dialog :users="post.like_users" :title="'気になるユーザー'" />
    </div>
    <!-- ======== メッセージ＆気になる ========= -->

    <v-avatar size="50" class="mr-3 my-4 small-image">
      <v-img v-if="post.image.url" :src="post.image.url" alt="avatar" />
      <v-img v-else :src="defaultImage" contain />
    </v-avatar>

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
      join: false,
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
        this.createDate = this.$dayjs(this.post.updated_at).format(
          'YYYY年MM月DD日'
        )
        this.releaseDate = this.$dayjs(this.post.release).format('YYYY/MM/DD')
        this.releaseYear = this.$dayjs(this.post.release).format('YYYY')
        this.releaseMonth = this.$dayjs(this.post.release).format('MM')
        this.releaseDay = this.$dayjs(this.post.release).format('DD')
        this.loading = true
        this.start_time = this.$dayjs(this.post.start_time).format('hh:mm')
        this.finish_time = this.$dayjs(this.post.finish_time).format('hh:mm')
      })
  },
  methods: {
    ...mapActions({
      likePost: 'post/likePost',
      unLikePost: 'post/unLikePost',
      joinPost: 'post/joinPost',
      unJoinPost: 'post/unJoinPost',
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
</style>
