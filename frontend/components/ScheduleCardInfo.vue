<template>
  <div>
    <!-- <template v-slot:opposite>
      <div class="grey--text">
        <div
          class="display-1 shadow-text3 font-weight-regular text-decoration-underlinemt-n3"
        >
          {{ post.name }}<br />
        </div>

        <div
          class="subtitle-2 shadow-text1 font-weight-regular text-decoration-underlinemt-n3"
        >
          {{ post.catchcopy }}
        </div>
        <div class="subtitle-1 mt-4 shadow-text2">
          {{ post.release }}
        </div>
      </div>
    </template> -->

    <v-card color="transparent" class="rounded-card">
      <v-img :src="post.image.url" class="rounded-card">
        <v-card-text class="align-bottom">
          <v-row>
            <v-col>
              <h1>{{ post.name }}</h1>

              <div>
                <h3 class="ml-2">{{ post.catchcopy }}</h3>
              </div>
            </v-col>
            <v-col> </v-col>
          </v-row>
        </v-card-text>
      </v-img>

      <v-sheet style="position: relative;">
        <button-like :user="loginUser" :post="post" :is-rounded-like="true" />
      </v-sheet>
    </v-card>
    <v-row class="ml-3 mt-n16">
      <v-col>
        <div class="ml-5  subtitle-1 mt-4 ">
          <strong> {{ post.release }}&nbsp;</strong>
        </div>
      </v-col>
      <v-col> </v-col>
    </v-row>

    <v-sheet color="transparent" class="mt-5"></v-sheet>
    <v-timeline dense class="ml-14">
      <v-timeline-item v-for="n in 1" :key="n">
        <template v-slot:opposite>
          <span>Tus eu perfecto</span>
        </template>

        <template v-slot:icon>
          <v-avatar>
            <img src="https://i.pravatar.cc/64" />
          </v-avatar>
        </template>

        <v-card class="elevation-10 mr-14" rounded-card>
          <v-card-title class="headline">
            Hi! {{ post.quickword }}
          </v-card-title>
          <v-card-text>
            {{ post.details }}
          </v-card-text>
        </v-card>
      </v-timeline-item>

      <v-timeline-item small>
        <!-- <template v-slot:opposite> -->
        <div class="headline pink--text font-weight-bold no-wrap-text">
          開始 {{ $dayjs(post.start_time).format('hh:mm') }}
        </div>
        <!-- </template> -->
        <div class="py-4">
          <h2 :class="`headline font-weight-light mb-4 pink--text`">
            <button-like
              :user="loginUser"
              :post="post"
              :is-rounded-join="true"
            />
            <strong>募集メンバー: {{ post.member }}人</strong>
            <div class="caption mb-2">予算: {{ post.price }}円/人</div>
            <user-dialog-shown :users="post.join_users" :title="'参加者'" />
          </h2>
          <div>
            Lorem ipsum
          </div>
        </div>
      </v-timeline-item>

      <v-timeline-item small>
        <!-- <template v-slot:opposite> -->
        <span :class="`headline font-weight-bold cyan--text`"
          >終了 {{ $dayjs(post.finish_time).format('hh:mm') }}</span
        >
        <!-- </template> -->
        <div class="py-4">
          <h2 :class="`headline font-weight-light mb-4 cyan--text`">
            Tomatoma ipsum
          </h2>
          <div>
            メッセージなどは以下のフォームでご相談ください。
          </div>
        </div>
      </v-timeline-item>
    </v-timeline>

    <div>
      <!-- <post-container-message :post="post" /> -->
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'

export default {
  components: {
    buttonLike,
    userDialogShown,
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
  text-shadow: 2px 2px 3px #f51818;
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

h1 {
  background: #b0dcfa; /*背景色*/
  padding: 0.5em; /*文字周りの余白*/
  color: white; /*文字を白に*/
  border-radius: 0.5em; /*角の丸み*/
}
</style>
