<template>
  <v-sheet class="ml-8 mr-8 mt-4  rounded">
    <v-card class="mx-auto" color="#26c6da" dark max-width="400">
      <v-card-title>
        <v-menu transition="scroll-x-transition">
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
        </v-menu>
        <span class="title font-weight-light">{{ message.title }}</span>
      </v-card-title>

      <v-card-text class="headline font-weight-bold">
        <v-row>
          <v-col cols="9">
            {{ message.content }}
          </v-col>
          <v-col cols="3">
            <template v-if="message.image.url">
              <v-avatar size="80" class="radius-image mt-3 mb-3">
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
      </v-card-text>

      <v-card-actions>
        <v-list-item class="grow">
          <v-list-item-avatar color="grey darken-3">
            <v-img
              class="elevation-6"
              alt=""
              src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"
            ></v-img>
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>Evan You</v-list-item-title>
          </v-list-item-content>

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
    </v-card>

    <v-card flat>
      <!--                <v-sheet class="green lighten-3 d-flex align-center ">
                <nuxt-link :to="{ path: `/users/${message.user_id}` }">
                  <user-avatar :size="50" :user="message.user" />-->
      <!--  </nuxt-link>
                <v-btn
                  class="ma-1"
                  plain
                  style="text-transform: none"
                  nuxt
                  :to="`/users/${message.user_id}`"
                >
                  {{ message.user.name }}
                </v-btn> -->

      <!--         <template
                  v-if="message.user_id === $store.state.auth.loginUser.id"
                > -->

      <!-- <the-modal-message-edit :review="message" /> -->
      <!-- <post-review-delete :review="message" /> -->
      <!-- </template> -->

      <!--                     <template v-if="login">
                  </template> -->
      <!-- ========Message's Image======= -->
    </v-card>

    <!-- ======== Rating & Title ========= -->
    <!--     <div class="ml-4 d-flex align-center">
      <v-rating
        v-model="rating"
        empty-icon="mdi-heart-outline"
        full-icon="mdi-heart"
        background-color="orange lighten-1"
        color="orange darken-2"
        readonly
        dense
        small
      />
    </div> -->
    <!-- ======== Rating & Title ========= -->
  </v-sheet>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'

export default {
  components: {
    userAvatar,
  },
  props: {
    message: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      createDate: '',
      rating: this.message.rate,
      expand: false,
      like: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
  },
  /*   watch: {
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
  }, */
  /*  methods: {
    ...mapActions({
      likeReview: 'review/likeReview',
      unLikeReview: 'review/unLikeReview',
    }),
    nice() {
      const postData = {
        user: this.$store.state.auth.loginUser.id,
        review: this.review.id,
      }
      if (this.like) {
        this.unLikeReview(postData).then(() => {
          this.like = false
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
            })
        })
      } else {
        this.likeReview(postData).then(() => {
          this.like = true
          this.$axios
            .$get(`/api/v1/posts/${this.$route.params.id}`)
            .then((res) => {
              this.$store.commit('post/setPost', res, { root: true })
            })
        })
      }
    },
  }, */
}
</script>

<style scoped>
.radius-image {
  border: 1px solid;
  border-radius: 20px;
  border-color: #bdbdbd;
}
.radius-big-image {
  border: 1px solid rgba(0, 0, 0.8);
  border-radius: 20px;
  border-color: #bdbdbd;
}
.arrow_box {
  position: relative;
  border: 1px solid black;
  padding: 5px 7px;
  color: #39c !important;
  text-decoration: underline !important;
  border-radius: 3px;
}
.arrow_box:after,
.arrow_box:before {
  right: 100%;
  top: 50%;
  border: solid transparent;
  content: '';
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}

.arrow_box:after {
  border-color: rgba(136, 183, 213, 0);
  border-right-color: white;
  border-width: 6px;
  margin-top: -6px;
}
.arrow_box:before {
  border-color: rgba(194, 225, 245, 0);
  border-right-color: black;
  border-width: 7px;
  margin-top: -7px;
}
</style>
