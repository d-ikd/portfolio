<template>
  <div>
    <v-sheet class="rounded-card" elevation="5">
      <v-card color="transparent" class="rounded-card " elevation="5">
        <v-img
          v-if="post.image.url"
          :src="post.image.url"
          class="rounded-card align-center text-center"
        >
        </v-img>
        <v-img v-else contain :src="defaultImage"> </v-img>
        <v-sheet style="position: relative;">
          <button-like :user="loginUser" :post="post" :is-rounded-like="true" />
        </v-sheet>
      </v-card>
      <v-card-text class="text-center align-self-center">
        <div class="orangecolor">
          <div
            class="display-1 shadow-text1 pink--text font-weight-bold no-wrap-text"
          >
            {{ post.name }}
          </div>
          <div class="shadow-text2 pink--text font-weight-bold no-wrap-text">
            {{ post.catchcopy }}
          </div>
        </div>
      </v-card-text>
      <v-row class="mt-2">
        <v-col>
          <div class="">
            <div
              class="headline
                    ml-8 pink--text font-weight-bold no-wrap-text"
            >
              <v-icon large left>
                mdi-alarm-check
              </v-icon>
              {{ post.release }}
            </div>
          </div>

          <!--           <div class="ml-5  subtitle-1 mt-4 ">
            <strong> {{ post.release }}&nbsp;</strong>
          </div> -->
        </v-col>
        <v-col> </v-col>
      </v-row>

      <v-sheet color="transparent" class="mt-5"></v-sheet>

      <v-timeline dense clipped>
        <v-timeline-item
          class="mb-4"
          color="grey"
          icon-color="grey lighten-2"
          small
        >
          <v-row justify="space-between">
            <v-col class="text-left" cols="5">
              <div
                class="headline
                    mr-8 pink--text font-weight-bold no-wrap-text"
              >
                開始 {{ $dayjs(post.start_time).format('hh:mm') }}
              </div>
            </v-col>

            <v-col cols="7">
              <v-chip color="orange" text-color="white">
                <v-icon left>
                  mdi-star
                </v-icon>

                場所: {{ post.place }}
              </v-chip>
            </v-col>
          </v-row>
        </v-timeline-item>

        <v-timeline-item class="mb-4" small>
          <v-row justify="space-between">
            <v-col class="text-left" cols="5">
              <span
                class="headline
                          mr-8
                          font-weight-bold cyan--text"
                >終了 {{ $dayjs(post.finish_time).format('hh:mm') }}</span
              >
            </v-col>
            <v-col cols="7">
              <v-chip color="primary" text-color="white">
                <v-icon left>
                  mdi-wallet-travel
                </v-icon>

                予算: {{ post.price }}円/人
              </v-chip>
            </v-col>
          </v-row>
        </v-timeline-item>

        <v-timeline-item fill-dot class="white--text mb-9" color="orange" large>
          <template v-slot:icon>
            <nuxt-link :to="{ path: `/users/${post.user.id}` }">
              <user-avatar
                :size="50"
                :user="post.user"
                class="list-avatar mx-3"
              />
            </nuxt-link>
          </template>

          <v-card class="elevation-2 mr-8" rounded-card>
            <v-card-title class="body-2">
              Hi! {{ post.quickword }}
            </v-card-title>
            <v-card-text>
              {{ post.details }}
            </v-card-text>
          </v-card>
        </v-timeline-item>
      </v-timeline>
      <v-sheet class="d-flex transparent align-center flex-column">
        <div class="mb-4">
          <v-btn
            color="purple white--text"
            outlined
            nuxt
            :to="{ path: `/post/${post.id}` }"
          >
            <v-icon dark>mdi-email-variant </v-icon>メッセージボックス
          </v-btn>
        </div>

        <div>
          <button-like
            :user="loginUser"
            :post="post"
            :is-rounded-join="true"
            class="mb-10"
          />
        </div>
      </v-sheet>
    </v-sheet>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import userAvatar from '~/components/infoUser/UserAvatar.vue'

export default {
  components: {
    buttonLike,
    userAvatar,
  },
  props: {
    post: {
      type: Object,
      default: () => {},
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require(`@/assets/images/default.png`),
      reverse: true,
      years: [
        {
          color: 'cyan',
          year: '1960',
        },
      ],
      dialog: false,
    }
  },
  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
            }
          })
        }
      })
  },
  computed: {
    ...mapGetters({
      posts: 'post/posts',
      loginUser: 'auth/loginUser',
    }),
  },
  methods: {
    closeDialog() {
      this.dialog = false
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.shadow-text1 {
  text-shadow: 1px 1px 2px #ffffff;
}
.shadow-text2 {
  text-shadow: 2px 2px 3px #ffffff;
  border-bottom: double;
}
.shadow-text3 {
  text-shadow: 2px 5px 50px;
}

svg {
  width: 100%;
  height: auto;
  overflow: visible;
}
text {
  fill: #333;
  stroke: #fff;
  stroke-width: 0.3;
  stroke-linejoin: round;
}

.orangecolor {
  background: #ffffff; /*背景色*/
  padding: 0.5em; /*文字周りの余白*/
  color: white; /*文字を白に*/
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 0.5em; /*角の丸み*/
}
</style>
