<template>
  <div style="background-color: white" class="mb-14">
    <!-- <v-btn depressed rounded text @click="logout"> ログアウト </v-btn> -->
    <v-row>
      <v-col
        v-for="p in posts"
        :key="p.id"
        class="d-flex align-stretch flex-wrap"
      >
        <template>
          <v-card
            :elevation="15"
            dark
            class="mx-auto orange ma-3 rounded-card"
            color="white"
            width="250"
          >
            <v-responsive
              :aspect-ratio="12 / 16"
              style="background-color: white"
            >
              <v-hover>
                <template v-slot:default="{ hover }">
                  <v-sheet dark flat color="white">
                    <v-img
                      v-if="p.image.url"
                      :src="p.image.url"
                      :aspect-ratio="1 / 1"
                      class="white--text align-top"
                    >
                      <span class="atmark-right">
                        <v-chip
                          class="mr-4 mt-4"
                          color="indigo"
                          text-color="white"
                          tile
                        >
                          @{{ p.place }}
                        </v-chip>
                      </span>
                    </v-img>
                    <v-img v-else contain :src="defaultImage">
                      <span class="atmark-right">
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
                        <template v-if="!login">
                          <v-btn
                            color="red white--text font-weight-bold"
                            absolute
                            fab
                            right
                            top
                            disabled
                          >
                            <v-icon>mdi-heart</v-icon>
                          </v-btn>
                        </template>
                        <template v-else>
                          <button-like
                            :user="user"
                            :post="p"
                            :is-rounded-like="true"
                          />
                        </template>
                        <div class="grey--text title">
                          <div class="font-weight-regular mt-4 text-truncate">
                            {{ p.name }}
                            <!-- <template v-if="loginUser.admin"> -->
                            <!-- {{ p.id }} -->
                            <!-- {{ p.user_id }} -->
                            <!-- </template> -->
                          </div>
                          <div
                            class="caption text-center mt-4 shadow-text text-truncate"
                          >
                            {{ p.catchcopy }}
                          </div>

                          <p
                            class="font-weight-thin overline no-wrap-text mt-4 mb-n1"
                            align="center"
                            justify="center"
                          >
                            {{
                              $dayjs(p.release).format('MM/DD')
                            }}&nbsp;&nbsp;{{
                              $dayjs(p.start_time).format('Ahh:mm')
                            }}~{{ $dayjs(p.finish_time).format('Ahh:mm') }}
                          </p>
                        </div>
                      </v-card-text>
                      <v-expand-transition>
                        <div
                          v-if="hover"
                          class="d-flex transition-fast-in-fast-out orange v-card--reveal display-3 white--text"
                          style="height: 100%;"
                        >
                          <nuxt-link :to="{ path: `/users/${p.user.id}` }">
                            <user-avatar
                              :size="50"
                              :user="p.user"
                              class="list-avatar mx-3"
                            />
                          </nuxt-link>
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
                <div
                  class="d-flex font-weight-thin subtitle-1 justify-center mt-n1 mb-n4"
                >
                  <span>
                    <like-counter
                      :users="p.join_users"
                      :post="p"
                      :icon="false"
                      :title="title"
                    />
                  </span>
                </div>
              </v-card-text>
            </v-responsive>
          </v-card>
        </template>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import likeCounter from '~/components/infoPost/LikeCounter.vue'
import dialogComponent from '~/components/layouts/DialogComponent.vue'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import theModalLogin from '~/components/layouts/TheModalLogin.vue'

export default {
  components: {
    buttonLike,
    likeCounter,
    dialogComponent,
    userAvatar,
    theModalLogin,
  },
  // props: {
  //   posts: {
  //     type: Array,
  //     required: true,
  //   },
  // },
  data() {
    return {
      title: '参加メンバー',
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
    reversePosts() {
      return this.posts.slice().reverse()
    },
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      loginModal: 'modal/loginModal',
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
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
    ...mapActions({
      getPosts: 'post/getPosts',
      logout: 'auth/logout',
      loginDialog: 'modal/loginUser',
    }),
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
.atmark-right {
  color: white;
  font-weight: bold;
  float: right;
}
</style>
