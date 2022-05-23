<template>
  <div style="background-color: white">
    <v-row>
      <v-col>
        <template v-if="post.reviews.length === 0">
          <h4 class="ma-3 text-decoration-underline">
            メッセージがありません。
          </h4>
          <dialog-component-about-message
            :post="post"
            is-message-create="true"
          />
          <the-modal-message-create v-if="login" :post="post" />
        </template>
        <template v-else>
          <list-component :isMessageListInId="true" :lists="post.reviews" />
        </template>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import listComponent from '~/components/layouts/ListComponent.vue'
import dialogComponentAboutMessage from '~/components/layouts/DialogComponentAboutMessage.vue'
import theModalMessageEdit from '~/components/layouts/TheModalMessageEdit.vue'
import theModalMessageCreate from '~/components/layouts/TheModalMessageCreate.vue'

export default {
  name: 'Stuctive',
  components: {
    dialogComponentAboutMessage,
    theModalMessageEdit,
    theModalMessageCreate,
    listComponent,
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

<style scoped></style>
