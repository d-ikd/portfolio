<template>
  <div>
    <v-sheet class="rounded-card" elevation="5">
      <div>
        <nuxt-link :to="{ path: `/post/${post.id}` }">
          <v-btn>
            参加ページへ
          </v-btn>
        </nuxt-link>
      </div>
      <v-card color="transparent" class="rounded-card " elevation="5">
        <v-img
          :src="post.image.url"
          class="rounded-card align-center text-center"
        >
          <v-card-text>
            <v-row class="ml-4">
              <div class="orangecolor">
                <div class="display-1 shadow-text1">{{ post.name }}</div>
                <div class="shadow-text2">{{ post.catchcopy }}</div>
              </div>
              <v-col cols="2"> </v-col>
            </v-row>
          </v-card-text>
        </v-img>
        <!-- <v-sheet style="position: relative;">
          <button-like
            :user="loginUser"
            :post="post"
            :is-rounded-like="true"
          />
        </v-sheet> -->
      </v-card>
      <v-row class="mt-6">
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
                  mdi-cake-variant
                </v-icon>

                予算: {{ post.price }}円/人
              </v-chip>
            </v-col>
          </v-row>
        </v-timeline-item>

        <v-timeline-item fill-dot class="white--text mb-9" color="orange" large>
          <template v-slot:icon>
            <v-avatar>
              <img src="https://i.pravatar.cc/64" />
            </v-avatar>
          </template>

          <v-card class="elevation-2 mr-8" rounded-card>
            <v-card-title class="body-1">
              Hi! {{ post.quickword }}
            </v-card-title>
            <v-card-text>
              {{ post.details }}
            </v-card-text>
          </v-card>
        </v-timeline-item>
      </v-timeline>
      <v-sheet class="d-flex transparent align-center flex-column">
        <div>
          <dialog-component-3
            :is-message-list="true"
            :post="post"
            class="mt-5 mb-5 "
          />
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
import dialogComponent3 from '~/components/layouts/DialogComponent3.vue'

export default {
  components: {
    buttonLike,
    dialogComponent3,
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
  text-shadow: 1px 1px 2px #f51818;
}
.shadow-text2 {
  text-shadow: 2px 2px 3px #f51818;
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
strong {
  position: relative;
  background: #eff4ff;
  padding: 2px 5px 2px 20px;
  font-size: 20px;
  color: #0f0f0f;
  border-radius: 0 10px 10px 0;
}

strong:before {
  font-family: 'Font Awesome 5 Free';
  content: '\f041';
  display: inline-block;
  line-height: 40px;
  position: absolute;
  padding: 0em;
  color: white;
  background: #81a1e4;
  font-weight: 900;
  width: 40px;
  text-align: center;
  height: 40px;
  line-height: 40px;
  left: -1.35em;
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  border-radius: 50%;
  box-shadow: 0px 2px 1px rgba(0, 0, 0, 0.29);
  border-bottom: solid 2px #4967b4;
}

.orangecolor {
  background: #f09b38; /*背景色*/
  padding: 0.5em; /*文字周りの余白*/
  color: white; /*文字を白に*/
  background-color: rgba(155, 255, 255, 0.8);
  border-radius: 0.5em; /*角の丸み*/
}
</style>
