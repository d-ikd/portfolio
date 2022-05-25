<template>
  <v-card class="mx-auto green lighten-3 mb-8" dark max-width="400">
    <v-row>
      <v-col cols="9">
        <v-card-title>
          <!--         <v-menu transition="scroll-x-transition">
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
          <span class="title font-weight-light">{{ message.title }}</span>
        </v-card-title>
        <v-card-text class="headline font-weight-bold">
          {{ message.content }}
        </v-card-text>
      </v-col>
      <v-col cols="3">
        <template v-if="message.image.url">
          <v-avatar size="80" class="radius-image mt-4">
            <v-img
              v-if="message.image.url"
              :src="message.image.url"
              alt="avatar"
            />
            <v-img v-else :src="defaultImage" contain />
          </v-avatar>
        </template>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="12">
        <v-card-actions>
          <v-list-item class="grow">
            <div class="d-flex align-center">
              <nuxt-link :to="{ path: `/post/${message.post.id}` }">
                <v-avatar size="50" class="mr-3 my-4 small-image">
                  <v-img
                    v-if="message.post.image.url"
                    :src="message.post.image.url"
                    alt="avatar"
                    contain
                  />
                  <v-img v-else :src="defaultImage" contain />
                </v-avatar>
              </nuxt-link>
              <nuxt-link :to="{ path: `/post/${message.post.id}` }">
                <span class="ml-2 body-2 black--text">
                  {{ message.post.name }} メッセージページへ
                </span>
              </nuxt-link>
            </div>
            <v-row align="center" justify="end">
              <v-icon class="mr-1">
                mdi-timelapse
              </v-icon>
              <span class="subheading">
                {{ $dayjs(message.created_at).format('MM/DD') }}&nbsp;{{
                  $dayjs(message.created_at).format('hh:mm')
                }}</span
              >
            </v-row>
          </v-list-item>
        </v-card-actions>
      </v-col>
    </v-row>
  </v-card>
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
.small-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
.small-image:hover {
  opacity: 0.7;
}
</style>
