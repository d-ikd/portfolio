<template>
  <v-row class="d-flex justify-end">
    <v-col>
      <v-dialog
        v-model="dialog"
        transition="slide-y-reverse-transition"
        persistent
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="orange"
            dark
            x-large
            v-bind="attrs"
            absolute
            fab
            left
            top
            class="mt-n13"
            v-on="on"
          >
            <v-icon dark right x-large>
              mdi-run
            </v-icon>
          </v-btn>
        </template>

        <v-card
          color="white"
          max-width="800"
          min-width="200"
          style="max-height: 600px"
          class="overflow-y-auto"
        >
          <v-card-title class="transparent white--text">
            <span class="headline"></span>

            <v-spacer></v-spacer>

            <v-menu bottom left>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="#BDBDBD88"
                  fab
                  dark
                  x-large
                  v-bind="attrs"
                  v-on="on"
                  @click="dialog = false"
                >
                  <v-icon color="white"> mdi-close-circle-outline</v-icon>
                </v-btn>
              </template>
            </v-menu>
          </v-card-title>

          <!--                                    <v-toolbar>
            <v-toolbar-title>Settings</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn
                dark
                text
                @click="dialog = false"
              >
                Save
              </v-btn>
            </v-toolbar-items>
          </v-toolbar> -->

          <div>
            <v-timeline
              :dense="$vuetify.breakpoint.smAndDown"
              class="mr-16"
              small
            >
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

                <v-card class="rounded-card">
                  <v-img contain :src="post.image.url"></v-img>
                </v-card>
              </v-timeline-item>
            </v-timeline>

            <v-parallax
              src="https://cdn.vuetifyjs.com/images/parallax/material2.jpg"
            >
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
                  <span :class="`headline font-weight-bold pink--text`"
                    >開始 {{ $dayjs(post.start_time).format('hh:mm') }}</span
                  >
                </template>
                <div class="py-4">
                  <h2 :class="`headline font-weight-light mb-4 pink--text`">
                    <strong>募集メンバー: {{ post.member }}人</strong>
                    <div class="caption mb-2">予算: {{ post.price }}円/人</div>
                    <button-like :user="user" :post="post" />
                    <user-dialog-shown
                      :users="post.join_users"
                      :title="'参加者'"
                    />
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

          <v-card-title class="transparent white--text">
            <span class="headline"></span>

            <v-spacer></v-spacer>

            <v-menu bottom left>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="#BDBDBD88"
                  fab
                  dark
                  x-large
                  v-bind="attrs"
                  v-on="on"
                  @click="dialog = false"
                >
                  <v-icon color="white"> mdi-close-circle-outline</v-icon>
                </v-btn>
              </template>
            </v-menu>
          </v-card-title>
        </v-card>
      </v-dialog>
    </v-col>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'
import postContainerLike from '~/components/infoPost/PostContainerLike.vue'
import postContainerMessage from '~/components/infoPost/PostContainerMessage.vue'
import buttonLike from '~/components/infoPost/ButtonLike.vue'
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'

export default {
  components: {
    postContainerLike,
    postContainerMessage,
    buttonLike,
    userDialogShown,
  },
  props: {
    post: {
      type: Object,
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
      user: 'auth/loginUser',
      loginUser: 'auth/loginUser',
    }),
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
