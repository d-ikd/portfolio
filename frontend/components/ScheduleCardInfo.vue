<template>
  <v-card>
    <div>
      <v-timeline :dense="$vuetify.breakpoint.smAndDown" class="mr-16" small>
        <v-timeline-item color="white">
          <template v-slot:icon>
            <!--               <v-icon x-large color="orange"> mdi-information-outline</v-icon> -->
            <!--               <v-icon x-large color="red"> mdi-arrow-down-bold</v-icon> -->
          </template>
          <template v-slot:opposite>
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
          </template>
          <button-like :user="loginUser" :post="post" :is-rounded-like="true" />
          <v-card class="rounded-card">
            <v-img :src="post.image.url"></v-img>
          </v-card>
        </v-timeline-item>
      </v-timeline>

      <v-parallax src="https://cdn.vuetifyjs.com/images/parallax/material2.jpg">
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
        </v-timeline>
      </v-parallax>

      <v-timeline class="mr-16">
        <v-timeline-item small>
          <template v-slot:opposite>
            <div class="headline pink--text font-weight-bold no-wrap-text">
              開始 {{ $dayjs(post.start_time).format('hh:mm') }}
            </div>
          </template>
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
      </v-timeline>
      <v-timeline class="mr-16">
        <v-timeline-item small>
          <template v-slot:opposite>
            <span :class="`headline font-weight-bold cyan--text`"
              >終了 {{ $dayjs(post.finish_time).format('hh:mm') }}</span
            >
          </template>
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
    </div>

    <div>
      <!-- <post-container-message :post="post" /> -->
    </div>

    <button-close @close-dialog="closeDialog" />
  </v-card>
</template>

<script>
import { mapGetters } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'

export default {
  components: {
    buttonLike,
    userDialogShown,
    buttonClose,
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
  text-shadow: 2px 5px 30px;
}
.shadow-text2 {
  border-bottom: double;
}
.shadow-text3 {
  text-shadow: 2px 5px 50px;
}
</style>
