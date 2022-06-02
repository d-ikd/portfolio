<template>
  <div>
    <template>
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
            <button-like
              :user="loginUser"
              :post="post"
              :is-rounded-like="true"
            />
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
              <v-col class="text-left" cols="6">
                <div
                  class="headline
                    mr-8 pink--text font-weight-bold no-wrap-text"
                >
                  {{ $dayjs(post.start_time).format('A hh:mm') }}から
                </div>
              </v-col>

              <v-col cols="6">
                <v-chip color="#D73964" text-color="white">
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
              <v-col class="text-left" cols="6">
                <span
                  class="headline
                          mr-8
                          font-weight-bold primary--text"
                  >{{ $dayjs(post.finish_time).format('A hh:mm') }}まで</span
                >
              </v-col>
              <v-col cols="6">
                <v-chip color="primary" text-color="white">
                  <v-icon left>
                    mdi-wallet-travel
                  </v-icon>

                  予算: {{ post.price }}円/人
                </v-chip>
              </v-col>
            </v-row>
          </v-timeline-item>

          <!-- <v-timeline-item hide-dot class="white--text mb-9" color="orange" large> -->
          <!--           <template v-slot:icon>
            <nuxt-link :to="{ path: `/users/${post.user.id}` }">
              <user-avatar
                :size="50"
                :user="post.user"
                class="list-avatar mx-3"
              />
            </nuxt-link>
          </template> -->

          <v-card class="elevation-2 ml-4 mr-4 mb-12" rounded-card>
            <v-card-title class="body-2">
              {{ post.quickword }}
            </v-card-title>
            <v-card-text>
              {{ post.details }}
            </v-card-text>
          </v-card>
          <!-- </v-timeline-item> -->
          <!--         <v-timeline-item dense hide-dot class="mt-n3 mb-n4" color="orange" large>

            <v-chip  color="white" text-color="purple">
              <v-icon class="ml-n2 mr-2">mdi-account-circle</v-icon>
              [ {{ post.join_users.length }} / {{ post.member }} ] 人
            </v-chip>
        </v-timeline-item>         -->

          <!--
        <v-timeline-item hide-dot class="white--text" color="orange" large>

                    <template v-slot:icon>
            <strong><span>参加</span></strong>
          </template>

            <v-card class="d-flex flex-wrap mb-6 rounded-card" flat tile>
        <v-sheet
          v-for="user in post.join_users"
          :key="user.id"
          class="text-center align-self-center"
          color="white"
        >
                  <nuxt-link :to="{ path: `/users/${user.id}` }">
          <user-avatar :size="50" :user="user" class="list-avatar mx-3" />
                    </nuxt-link>
        </v-sheet>
      </v-card>
        </v-timeline-item>
 -->
          <v-timeline-item hide-dot class="mt-n8"> </v-timeline-item>

          <div>
            <button-like
              :user="loginUser"
              :post="post"
              :is-rounded-join="true"
              class="ml-3 mb-10"
            />
          </div>

          <div class="mb-5">
            <v-btn
              color="blue"
              nuxt
              x-large
              :to="{ path: `/post/${post.id}` }"
              class="ml-3 white--text"
            >
              <v-icon color="white">mdi-email-variant </v-icon
              >&nbsp;参加したい気持ちをメッセージで伝えましょう！&nbsp;&nbsp;
            </v-btn>
          </div>
        </v-timeline>
        <v-sheet class="d-flex transparent align-center flex-column"> </v-sheet>
      </v-sheet>
    </template>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
// import userAvatar from '~/components/infoUser/UserAvatar.vue'
// import postMessage from '~/components/infoPost/PostMessage.vue'

export default {
  components: {
    buttonLike,
    // userAvatar,
    // postMessage,
  },
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require(`@/assets/images/default.png`),
      reverse: true,
      years: [
        {
          color: 'primary',
          year: '1960',
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
      dialog: false,
    }
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
