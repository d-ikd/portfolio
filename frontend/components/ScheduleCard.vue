<template>
  <div style="background-color: white" class="mb-14">
    <!--     <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
      </v-carousel-item>
    </v-carousel> -->
    <v-row>
      <!--
      <v-col
        v-for="p in reversePosts"
        :key="p.id"
        class="d-flex child-flex flex-wrap"
      >
  -->
      <v-col v-for="p in posts" :key="p.id" class="d-flex flex-wrap">
        <v-card
          :elevation="15"
          dark
          class="mx-auto green secondary ma-3 rounded-card"
        >
          <v-responsive :aspect-ratio="10 / 16">
            <v-hover>
              <template v-slot:default="{ hover }">
                <v-sheet dark flat color="white">
                  <v-img
                    v-if="p.image.url"
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
                  </v-img>
                  <div style="position: relative;">
                    <v-card-text style="position: relative;">
                      <dialog-component
                        :is-schedule-card-info="true"
                        :post="p"
                      />
                      <!-- <schedule-card-info :post="p" /> -->
                      <button-like
                        :user="user"
                        :post="p"
                        :is-rounded-like="true"
                      />
                      <div class="grey--text title">
                        <div class="font-weight-regular mt-4">
                          {{ p.name }} {{ p.id }}
                        </div>
                        <div class="caption text-center mt-4 shadow-text">
                          キャッチコピー / {{ likeCount }}
                        </div>

                        <p
                          class="font-weight-thin overline no-wrap-text mt-4 mb-n1"
                          align="center"
                          justify="center"
                        >
                          {{ $dayjs(p.release).format('MM/DD') }}&nbsp;&nbsp;{{
                            $dayjs(p.start_time).format('hh:mm')
                          }}~{{ $dayjs(p.finish_time).format('hh:mm') }}
                        </p>
                      </div>
                    </v-card-text>
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex transition-fast-in-fast-out orange darken-2 v-card--reveal display-3 white--text"
                        style="height: 100%;"
                      >
                        <v-avatar class="ml-2">
                          <img
                            alt="user"
                            :src="require(`@/assets/images/default-user.png`)"
                          />
                        </v-avatar>
                        <div class="caption text-center mr-3 ml-1">
                          {{ p.quickword }}
                        </div>
                      </div>
                    </v-expand-transition>
                  </div>
                </v-sheet>
              </template>
            </v-hover>

            <v-card-text class="orange">
              <div class="d-flex font-weight-thin subtitle-1 justify-center ">
                <span>
                  <counter-list
                    :users="p.like_users"
                    :post="p"
                    :ppp="p.like_users"
                    :icon="true"
                    :title="title1"
                  /> </span
                >&nbsp;&nbsp;&nbsp;&nbsp;
                <span>
                  <counter-list
                    :users="p.join_users"
                    :post="p"
                    :icon="false"
                    :title="title2"
                  />
                </span>
              </div>
            </v-card-text>
          </v-responsive>
        </v-card>
      </v-col>
    </v-row>
  </div>

  <!--
                                               </v-img>
                      <v-img v-else contain :src="defaultImage">
                        -->
  <!--
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
    </v-list> -->
  <!--                                       <p class="black--text"> index:{{ i + 1 }} </p>
            <p class="black--text"> like:{{ p.like_users.length }} </p>
            <p class="black--text"> id:{{ p.id }} </p>
             -->
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'
import userDialogLike from '~/components/infoUser/UserDialogLike.vue'
import counterList from '~/components/CounterList.vue'
import userDialog from '~/components/infoUser/UserDialog.vue'
import userDialogReview from '~/components/infoUser/UserDialogReview.vue'
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import postReview2 from '~/components/infoPost/PostReview2.vue'
import dialogComponent from '~/components/layouts/DialogComponent.vue'

export default {
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
    dialogComponent,
  },
  // props: {
  //   posts: {
  //     type: Array,
  //     required: true,
  //   },
  // },
  data() {
    return {
      title1: 'いいねした人',
      title2: '参加する人',
      loading: false,
      like: false,
      join: false,
      dialog: false,
      show: false,
      defaultImage: require(`@/assets/images/default.png`),
      posts: [],
    }
  },
  computed: {
    likeCount() {
      return this.post.like_users.length
    },
    joinCount() {
      return this.post.join_users.length
    },
    reversePosts() {
      return this.posts.slice().reverse()
    },
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      /* currentPosts: 'favOrNotCheck/posts', */
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
    userUpdate() {
      return this.$store.state.auth.loginUser
    },
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
        this.loading = true
      })
  },
  methods: {
    ...mapActions({ getPosts: 'post/getPosts' }),
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
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
