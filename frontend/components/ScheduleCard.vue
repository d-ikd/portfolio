<template>
  <div style="background-color: white">
    <!-- <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
      </v-carousel-item>
    </v-carousel> -->
    <v-row>
      <v-col
        v-for="p in posts"
        :key="p.id"
        class="d-flex child-flex flex-wrap"
        cols="3"
      >
        <v-card
          :elevation="15"
          dark
          class="mx-auto green secondary ma-3 rounded-card"
        >
          <v-responsive :aspect-ratio="9 / 16">
            <v-hover>
              <template v-slot:default="{ hover }">
                <v-sheet dark flat color="white">
                  <v-img
                    v-if="p.image.url"
                    contain
                    :src="p.image.url"
                    :aspect-ratio="1 / 1"
                    class="white--text align-top"
                  >
                    <span class="my-span">
                      <v-chip
                        class="mr-4 mt-4"
                        color="indigo"
                        text-color="white"
                      >
                        @{{ p.place }}
                      </v-chip>
                    </span>
                    <!-- </v-img>
                      <v-img v-else contain :src="defaultImage"> -->
                  </v-img>

                  <v-card-text style="position: relative;">
                    <schedule-card-info :post="p" />
                    <button-like :user="user" :post="p" />
                    <div class="grey--text title">
                      <!--                                       <p class="black--text"> index:{{ i + 1 }} </p>
            <p class="black--text"> like:{{ p.like_users.length }} </p>
            <p class="black--text"> id:{{ p.id }} </p>
            -->

                      <div
                        class="font-weight-regular text-decoration-underlinemt-n3"
                      >
                        <v-list style="background-color: white">
                          <v-card
                            v-for="review in p.reviews"
                            :key="review.id"
                            flat
                            class="mb-2 black--text"
                            style="background-color: white"
                          >
                            <post-review2 :review="review" />
                          </v-card>
                        </v-list>

                        {{ p.name }}
                      </div>
                      <div class="caption text-center mt-4 shadow-text">
                        キャッチコピー
                      </div>

                      <p
                        class="font-weight-thin overline mt-4 mb-n1"
                        align="center"
                        justify="center"
                      >
                        {{ $dayjs(p.release).format('MM/DD') }}&nbsp;&nbsp;{{
                          $dayjs(p.start_time).format('hh:mm')
                        }}~{{ $dayjs(p.finish_time).format('hh:mm') }}
                      </p>
                    </div>

                    <!--                         <v-fade-transition>
                          <v-overlay v-if="hover" absolute color="#036358">
                            <v-btn
                              large
                              :to="{ path: `/post/${post.id}` }"
                              @click="pagelink(post.id)"
                              >参加ページ</v-btn
                            >
                          </v-overlay>
                        </v-fade-transition> -->
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex transition-fast-in-fast-out orange darken-2 v-card--reveal display-3 white--text"
                        style="height: 105%;"
                      >
                        <v-avatar>
                          <img
                            alt="user"
                            :src="require(`@/assets/images/default-user.png`)"
                          />
                        </v-avatar>
                        <div class="caption text-center mt-4 shadow-text">
                          みんなに一言
                        </div>
                      </div>
                    </v-expand-transition>
                  </v-card-text>
                </v-sheet>
              </template>
            </v-hover>

            <v-card-text class="orange font-weight-bold">
              <div class="show-rate">
                <span> <v-icon>mdi-heart</v-icon>&nbsp; </span>
                (&nbsp;
                <span>
                  <counter-list
                    :users="p.like_users"
                    :post="p"
                    :title="title1"
                  />
                </span>
                &nbsp;) <v-icon>mdi-run</v-icon>&nbsp; (&nbsp;
                <span>
                  <counter-list
                    :users="p.join_users"
                    :post="p"
                    :title="title2"
                  />
                  &nbsp;
                </span>
                <span> /&nbsp;{{ p.member }}&nbsp;) </span>
              </div>
            </v-card-text>
          </v-responsive>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import buttonLike from '~/components/infoPost/ButtonLike.vue'
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'
import userDialogLike from '~/components/infoUser/UserDialogLike.vue'
import counterList from '~/components/CounterList.vue'
import userDialog from '~/components/infoUser/UserDialog.vue'
import userDialogReview from '~/components/infoUser/UserDialogReview.vue'
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import postReview2 from '~/components/infoPost/PostReview2.vue'

export default {
  // props: {
  //   posts: {
  //     type: Array,
  //     required: true,
  //   },
  // },
  components: {
    // userPostList,
    buttonLike,
    userDialogShown,
    userDialogLike,
    counterList,
    userDialog,
    userDialogReview,
    scheduleCardInfo,
    postReview2,
  },
  data() {
    return {
      title1: 'いいねした人',
      title2: '参加する人',
      loading: false,
      like: false,
      join: false,
      dialog: false,
      show: false,
      createDate: '',
      releaseDate: '',
      start_time: '',
      finish_time: '',
      defaultImage: require(`@/assets/images/default.png`),
      posts: [],
    }
  },
  computed: {
    /*     reversePosts() {
      return this.posts.slice().reverse();
    }, */
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      currentPosts: 'favOrNotCheck/posts',
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },
  created() {
    this.getPosts().then(() => {
      this.loading = true
    })
    this.$axios.get('api/v1/posts').then((res) => {
      this.posts = res.data
    })
    this.$axios
      .get(`api/v1/posts/${this.post.id}`)
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
          this.add = false
          this.currentPosts.forEach((f) => {
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
        this.start_time = this.$dayjs(this.post.start_time).format('hh:mm')
        this.finish_time = this.$dayjs(this.post.finish_time).format('hh:mm')
        this.loading = true
      })
  },
  methods: {
    ...mapActions({ getPosts: 'post/getPosts' }),
    pagelink(link) {
      this.$router.push({ path: `/post/${link}` })
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}

.show-rate {
  font-size: 18px;
  font-weight: 200;
  display: flex;
  align-items: center;
}
.v-card--reveal {
  align-items: center;
  bottom: 0;
  justify-content: center;
  opacity: 0.9;
  position: absolute;
  width: 100%;
}
.shadow-text {
  text-shadow: 2px 5px 10px;
  border-bottom: double;
}
.my-span {
  color: white;
  font-weight: bold;
  float: right;
}
</style>
