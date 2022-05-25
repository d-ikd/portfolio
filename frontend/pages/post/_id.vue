<template>
  <div>
    <v-app-bar :clipped-left="clipped" app color="#B0DFC1">
      <nuxt-link to="/" class="link">
        <v-toolbar-title class="headertitle">Stuctive</v-toolbar-title>
      </nuxt-link>

      <v-spacer />
    </v-app-bar>

    <v-row no-gutters class="mt-10 mb-10">
      <v-col> </v-col>
      <v-col cols="sm" class="text-center align-self-center">
        <v-sheet elevation="4" class="rounded-pill">
          <template>
            <v-chip label color="white" large outlined text-color="red">
              <v-icon>mdi-run</v-icon> {{ post.name }}
            </v-chip>
          </template>
        </v-sheet>
      </v-col>
      <v-col> </v-col>
    </v-row>
    <v-row>
      <v-col>
        <template v-if="post.reviews.length === 0">
          <h4 class="ma-3 text-decoration-underline">
            メッセージがありません。
          </h4>
        </template>
        <template v-else>
          <post-review-list :reviews="post.reviews" />
          <!-- <list-component :is-message-list-in-id="true" :lists="post.reviews" /> -->
        </template>
      </v-col>
    </v-row>
    <the-modal-message-create :post="post" />
    <nuxt-link to="/" class="link">
      <v-toolbar-title class="header-title">TOPに戻る</v-toolbar-title>
    </nuxt-link>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import PostReviewList from '~/components/infoPost/PostReviewList.vue'
/* import listComponent from '~/components/layouts/ListComponent.vue' */
/* import postAlbum from '~/components/infoPost/postAlbum.vue' */
import theModalMessageCreate from '~/components/layouts/TheModalMessageCreate.vue'

export default {
  name: 'Stuctive',
  components: {
    PostReviewList,
    theModalMessageCreate,
    /* listComponent, */
    /* postAlbum, */
  },
  data() {
    return {
      loading: false,
      review: true,
      createDate: '',
      releaseDate: '',
      start_time: '',
      finish_time: '',
      defaultImage: require('@/assets/images/default-user.png'),
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      currentPosts: 'favOrNotCheck/posts',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
  },
  watch: {
    postUpdate() {
      this.$axios.get(`api/v1/posts/${this.$route.params.id}`).then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
        console.log(res.data)
      })
    },
    /*
    loginUserReview() {
      // ユーザーがすでにレビューを投稿してたら非表示にする
      if (this.login) {
        this.review = true
        this.post.reviews.forEach((f) => {
          if (f.user_id === this.user.id) {
            this.review = false
          }
        })
      }
    }, */
  },
  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        if (this.login) {
          this.post.like_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.like = true
            }
          })
        }
      })
      .then(() => {
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
            }
          })
        }
        this.createDate = this.$dayjs(this.post.updated_at).format(
          'YYYY年MM月DD日'
        )
        this.releaseDate = this.$dayjs(this.post.release).format('YYYY/MM/DD')
        this.releaseYear = this.$dayjs(this.post.release).format('YYYY')
        this.releaseMonth = this.$dayjs(this.post.release).format('MM')
        this.releaseDay = this.$dayjs(this.post.release).format('DD')
        this.start_time = this.$dayjs(this.post.start_time).format('hh:mm')
        this.finish_time = this.$dayjs(this.post.finish_time).format('hh:mm')
        this.loading = true
      })
  },
  methods: {
    ...mapActions({
      likePost: 'post/likePost',
      unLikePost: 'post/unLikePost',
      joinPost: 'post/joinPost',
      unJoinPost: 'post/unJoinPost',
    }),
  },
}
</script>

<style scoped>
.headertitle {
  color: white;
  font-size: 40px;
  font-family: 'Fraunces', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
.link {
  text-decoration: none;
}
</style>
