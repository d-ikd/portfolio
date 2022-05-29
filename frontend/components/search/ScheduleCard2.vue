<template>
  <!-- <user-post-list :posts="posts" /> -->
  <div style="background-color: white" class="mb-14">
    <v-row>
      <v-col
        v-for="p in posts"
        :key="p.id"
        class="d-flex align-stretch flex-wrap"
      >
        <v-card
          :elevation="15"
          dark
          class="mx-auto orange ma-3 rounded-card"
          color="white"
          width="250"
        >
          <v-responsive :aspect-ratio="12 / 16" style="background-color: white">
            <v-hover>
              <template v-slot:default="{ hover }">
                <v-sheet dark flat color="white">
                  <v-img
                    v-if="p.image.url"
                    :src="p.image.url"
                    :aspect-ratio="1 / 1"
                    class="white--text align-top"
                  >
                    <v-fade-transition>
                      <v-overlay v-if="hover" absolute color="#036358">
                        <v-btn
                          large
                          :to="{ path: `/post/${post.id}` }"
                          @click="pagelink(post.id)"
                          >参加ページ</v-btn
                        >
                      </v-overlay>
                    </v-fade-transition>

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
                      <!-- <dialog-component
                        :is-schedule-card-info="true"
                        :post="p"
                      /> -->
                      <button-like
                        :user="user"
                        :post="p"
                        :is-rounded-like="true"
                      />
                      <div class="grey--text title">
                        <div class="font-weight-regular mt-4 text-truncate">
                          {{ p.name }} {{ p.id }} {{ p.user_id }}
                        </div>
                        <div
                          class="caption text-center mt-4 shadow-text text-truncate"
                        >
                          キャッチコピー
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
                    <!-- <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex transition-fast-in-fast-out orange darken-2 v-card--reveal display-3 white--text"
                        style="height: 100%;"
                      >
                      ======error=======
                        <nuxt-link :to="{ path: `/users/${p.user.id}` }">
                          <user-avatar
                            :size="50"
                            :user="p.user"
                            class="list-avatar mx-3"
                          />
                        </nuxt-link>
                      ======error=======
                        <div class="caption text-center mr-3 ml-1">
                          {{ p.quickword }}
                        </div>
                      </div>
                    </v-expand-transition> -->
                  </div>
                </v-sheet>
              </template>
            </v-hover>

            <!-- <v-card-text class="orange">
              <div class="d-flex font-weight-thin subtitle-1 justify-center ">
                <span>
                  <like-counter
                    :users="p.join_users"
                    :post="p"
                    :icon="false"
                    :title="title"
                  />
                </span>
              </div>
            </v-card-text> -->
          </v-responsive>
        </v-card>
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

export default {
  components: {
    buttonLike,
    likeCounter,
    dialogComponent,
    userAvatar,
  },
  props: {
    posts: {
      type: Array,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      title: '参加メンバー',
      loading: false,
      like: false,
      join: false,
      dialog: false,
      show: false,
      defaultImage: require(`@/assets/images/default.png`),
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
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
.atmark-right {
  color: white;
  font-weight: bold;
  float: right;
}
</style>
