<template>
  <div>
    <v-card class="mx-auto blue lighten-3 mt-8" dark max-width="400">
      <v-row>
        <v-col cols="8">
          <v-card-title>
            <!-- <v-menu transition="scroll-x-transition">
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="white"
                  class="ma-2"
                  v-bind="attrs"
                  outlined
                  icon
                  v-on="on"
                >
                  <v-icon>mdi-magnify</v-icon>
                </v-btn>
              </template>
              <v-avatar size="500" class="radius-image">
                <v-img
                  v-if="message.image.url"
                  :src="message.image.url"
                  alt="avatar"
                />
                <v-img v-else :src="defaultImage" contain />
              </v-avatar>
            </v-menu> -->
            <span class="headline font-weight-bold">{{ message.title }}</span>
          </v-card-title>
          <v-card-text class="title font-weight-light">
            {{ message.content }}
          </v-card-text>
        </v-col>
        <v-col cols="4">
          <template v-if="message.image.url">
            <v-img
              v-if="message.image.url"
              :src="message.image.url"
              alt="avatar"
              :aspect-ratio="1 / 1"
              class="rounded-card mr-4 mt-4"
            />
            <v-img v-else :src="defaultImage" contain />
          </template>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" class="mt-n5">
          <v-card-actions>
            <v-list-item class="grow">
              <v-row align="center" justify="end">
                <v-icon class="mr-1">
                  mdi-timelapse
                </v-icon>
                <span class="subheading mr-2">
                  {{ $dayjs(message.created_at).format('MM/DD') }}&nbsp;{{
                    $dayjs(message.created_at).format('hh:mm')
                  }}</span
                >
              </v-row>
            </v-list-item>
          </v-card-actions>
        </v-col>
      </v-row>
      <div class="text-center align-self-center">
        <v-chip
          pill
          nuxt
          :to="`/post/${message.post.id}`"
          color="white"
          outlined
          class="white--text font-weight-bold mb-2"
        >
          <v-avatar left>
            <v-img
              v-if="message.post.image.url"
              :src="message.post.image.url"
              alt="avatar"
            />
            <v-img v-else :src="defaultImage" />
          </v-avatar>
          {{ message.post.name }}&nbsp;メンバーズページへ
        </v-chip>
      </div>
    </v-card>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
/* import theModalMessageEdit from '~/components/layouts/TheModalMessageEdit.vue' */
/* import postReviewDelete from '~/components/infoPost/PostReviewDelete.vue' */

export default {
  components: {
    /* theModalMessageEdit, */
    /* postReviewDelete, */
  },
  props: {
    message: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      createDate: '',
      expand: false,
      defaultImage: require('@/assets/images/default.png'),
      like: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserReview() {
      return this.$store.state.user.user
    },
  },
  watch: {
    loginUserReview() {
      if (this.login) {
        this.like = false
        this.message.review_likes.forEach((f) => {
          if (f.user_id === this.loginUser.id) {
            this.like = true
          }
        })
      }
    },
  },
  mounted() {
    this.createDate = this.$dayjs(this.message.created_at).format('YYYY/MM/DD')
    if (this.login) {
      this.like = false
      this.message.review_likes.forEach((f) => {
        if (f.user_id === this.loginUser.id) {
          this.like = true
        }
      })
    }
  },
  methods: {
    ...mapActions({
      likeReview: 'review/likeReview',
      unLikeReview: 'review/unLikeReview',
    }),
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.small-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
.small-image:hover {
  opacity: 0.7;
}
</style>
