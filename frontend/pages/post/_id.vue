<template>
  <div>
    <v-app-bar color="#7a99cf">
      <nuxt-link to="/" class="link">
        <v-toolbar-title class="headertitle">Stuctive</v-toolbar-title>
      </nuxt-link>
      <v-spacer />
      <template v-if="loggedIn">
        <the-modal-post-edit :post="post" />
        <the-modal-post-delete :post="post" />

        <dialog-component :is-account-page="true" class="mt-5" />
      </template>
    </v-app-bar>

    <button-like :user="user" :post="post" :is-rounded-like="true" />

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
        <div>
          <button-like
            :is-rounded-join="true"
            :post="post"
            :user="user"
            class="mt-5"
          />
        </div>
      </v-col>
      <v-col> </v-col>
    </v-row>

    <div>
      <post-member :users="post.join_users" :title="title" :post="post" />
    </div>
    <v-row>
      <v-col>
        <template v-if="post.reviews.length === 0">
          <h4 class="ma-3 text-decoration-underline">
            メッセージがありません。
          </h4>
          <the-modal-message-create :post="post" />
        </template>
        <template v-else>
          <post-review-list :reviews="post.reviews" />
          <!-- <list-component :is-message-list-in-id="true" :lists="post.reviews" /> -->
        </template>
      </v-col>
    </v-row>
    <div class="text-center align-self-center">
      <v-btn color="purple white--text" outlined nuxt to="/" class="link">
        <v-icon dark>mdi-email-variant </v-icon>TOPに戻る
      </v-btn>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import postReviewList from '~/components/infoPost/PostReviewList.vue'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import postMember from '~/components/infoPost/PostMember.vue'
/* import listComponent from '~/components/layouts/ListComponent.vue' */
/* import postAlbum from '~/components/infoPost/postAlbum.vue' */
import theModalMessageCreate from '~/components/layouts/TheModalMessageCreate.vue'
import dialogComponent from '~/components/layouts/DialogComponent.vue'
import theModalPostDelete from '~/components/layouts/TheModalPostDelete.vue'
import theModalPostEdit from '~/components/layouts/TheModalPostEdit.vue'

export default {
  components: {
    postReviewList,
    buttonLike,
    postMember,
    theModalMessageCreate,
    /* listComponent, */
    /* postAlbum, */
    dialogComponent,
    theModalPostDelete,
    theModalPostEdit,
  },
  data() {
    return {
      title: '参加メンバー',
      loading: false,
      like: false,
      join: false,
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
      loggedIn: 'auth/isLoggedIn',
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
    },
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
