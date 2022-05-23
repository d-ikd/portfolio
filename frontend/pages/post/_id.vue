<template>
  <div style="background-color: white">
    <!--
<v-parallax
:src="post.image"
>
          <v-row>
        <v-col class="text-center" cols="12">
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
        </v-col>
      </v-row>
    </v-parallax>
{{ post.image.url }} -->
    <div>
      <!-- <schedule-card-info :post="post" /> -->
    </div>
    <!--
    <v-container>
      <v-row>
        <v-col cols="12" sm="6" md="12" lg="10">
          <v-sheet elevation="10" rounded="xl" class="green lighten-2">
            <v-sheet class="pl-5 primary" dark rounded="t-xl">
              <div>
                <div class="my-5 show-rate">
                  <span>
                    <h3>
                      <v-avatar size="60">
                        <v-img
                          src="https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned"
                        ></v-img>
                      </v-avatar>
                    </h3>
                  </span>
                  <span class="pr-3">
                    {{ createDate }}
                  </span>
                </div>
              </div>
            </v-sheet>
            <v-sheet class="green lighten-2">
              <v-row no-gutters>
                <v-col cols="12" sm="6">
                  <v-sheet class="green lighten-2">
                    <v-card-text>
                      {{ post.details }}
                    </v-card-text>
                  </v-sheet>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-sheet class="green lighten-2 mb-4">
                    <v-timeline align-top dense>
                      <v-timeline-item color="white lighten-3" fill-dot small>
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
                                src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairFrida&accessoriesType=Kurt&hairColor=Red&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=Wink&eyebrowType=RaisedExcitedNatural&mouthType=Disbelief&skinColor=Brown"
                              ></v-img>
                            </v-avatar>
                            <v-avatar>
                              <v-img
                                src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light"
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
                      <v-timeline-item fill-dot small>
                        <v-row class="pt-1">
                          <v-col cols="3">
                            <strong>終了: {{ finish_time }}</strong>
                          </v-col>
                        </v-row>
                      </v-timeline-item>
                    </v-timeline>
                  </v-sheet>
                </v-col>
              </v-row>
            </v-sheet>

            <v-row no-gutters>
              <v-col cols="12" sm="6">
                <v-sheet
                  class="green lighten-2 mb-4"
                  align="center"
                  justify="center"
                >
                  <v-btn
                    v-if="like"
                    class="mx-5"
                    color="red white--text font-weight-bold"
                    outlined
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
                    <v-icon class="mr-1">mdi-heart</v-icon>
                    気になる！
                  </v-btn>
                </v-sheet>
              </v-col>
              <v-col cols="12" sm="6">
                <div align="center" justify="center" class="mt5">
                  <v-btn
                    v-if="join"
                    class="mx-5"
                    color="red white--text font-weight-bold"
                    outlined
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
                    <v-icon class="mr-1">mdi-walk</v-icon>
                    参加する！
                  </v-btn>
                </div>
              </v-col>
            </v-row>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
    <v-divider class="g-8" />
 -->
    <!--     <v-container>
      <v-row justify="center">
        <v-col cols="12" sm="7" md="12" lg="5">
          <v-sheet elevation="10" rounded="xl" class="green lighten-2">
            <v-sheet dark rounded="t-xl"> </v-sheet>

            <div class="pa-4">
              <v-tabs
                v-model="tab"
                background-color="transparent"
                class="green lighten-2 white--text font-weight-bold"
                grow
                icons-and-text
                dark
                center-active
              >
                <v-tab v-for="(item, index) in items" :key="index">
                  <h3 class="pl-2 mb-2">
                    <v-icon>{{ item.icon }}</v-icon>
                    {{ item.title }}
                    <span>（{{ post.reviews.length }}）</span>
                  </h3>
                </v-tab>

                <v-tabs-items v-model="tab">
                  <v-tab-item>
                    <v-row>
                      <v-col>
                        <template v-if="post.reviews.length === 0">
                          <h4 class="ma-3 text-decoration-underline">
                            メッセージがありません。
                          </h4>
                          <post-review-modal v-if="login" :post="post" />
                        </template>
                        <template v-else>
                          <post-review-list :reviews="post.reviews" />
                        </template>
                      </v-col>
                    </v-row>
                  </v-tab-item>
                  <v-tab-item>
                    <p>test</p>
                  </v-tab-item>
                </v-tabs-items>
              </v-tabs>
            </div>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container> -->

    <v-divider class="mb-8" />

    <!-- <postParallax :post="post" class="mt-8" /> -->
    <!-- <post-container-like class="g-8" /> -->
    <post-container-message class="mb-8" />
    <!-- <postAlbum /> -->

    <div align="center" justify="end" class="mt-4">
      <v-btn
        large
        class="mb-5"
        color="green white--text font-weight-bold"
        @click="nice"
      >
        <v-icon>mdi-heart</v-icon>
        アルバムに投稿する！
      </v-btn>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import postParallax from '~/components/infoPost/postParallax.vue'
import postContainerMessage from '~/components/infoPost/PostContainerMessage.vue'
import postReviewModal from '~/components/infoPost/postReviewModal.vue'
import postReviewList from '~/components/infoPost/postReviewList.vue'
import postContainerLike from '~/components/infoPost/PostContainerLike.vue'
/* import postAlbum from '~/components/infoPost/postAlbum.vue' */
import scheduleCardInfo from '~/components/scheduleCardInfo.vue'

export default {
  name: 'MeetWithKids',
  components: {
    postContainerMessage,
    postContainerLike,
    postReviewModal,
    postReviewList,
    /* postAlbum, */
    scheduleCardInfo,
  },
  data() {
    return {
      items: [
        {
          icon: 'mdi-email-outline',
          title: 'メッセージ',
        },
        {
          icon: 'mdi-file-document-box',
          title: '感想・アンケート',
        },
      ],
      tags: [
        'Work',
        'Home Improvement',
        'Vacation',
        'Food',
        'Drawers',
        'Shopping',
        'Art',
        'Tech',
        'Creative Writing',
      ],
      text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      tab: null,
      loading: false,
      like: false,
      join: false,
      review: true,
      add: false,
      createDate: '',
      releaseDate: '',
      start_time: '',
      finish_time: '',
      defaultImage: require('@/assets/images/default-user.png'),
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      currentPosts: 'favOrNotCheck/posts',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
  },
  watch: {
    postUpdate() {
      this.$axios.get(`api/v1/posts/${this.$route.params.id}`).then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
        console.log(res.data)
      })
    },
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
        this.currentPosts.forEach((f) => {
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
        if (this.login) {
          this.post.like_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.like = true
            }
          })
          this.add = false
          this.currentPosts.forEach((f) => {
            if (f.id === this.post.id) {
              this.add = true
            }
          })
        }
      })
      .then(() => {
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
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
        this.start_time = this.$dayjs(this.post.start_time).format('hh:mm')
        this.finish_time = this.$dayjs(this.post.finish_time).format('hh:mm')
        this.loading = true
      })
  },
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

<style scoped>
.show-rate {
  font-size: 20px;
  font-weight: 200;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>
