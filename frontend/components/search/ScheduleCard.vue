<template>
  <div style="background-color: white">
    <!--     <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
      </v-carousel-item>
    </v-carousel> -->
    <v-row>
      <v-col
        v-for="(post, i) in reversePosts"
        :key="post.id"
        class="d-flex child-flex flex-wrap"
        cols="4"
      >
        <p class="black--text">index:{{ i + 1 }}</p>
        <p class="black--text">like:{{ post.like_users.length }}</p>
        <p class="black--text">id:{{ post.id }}</p>
        <button-like
          :user="user"
          :post="post"
          :fronttitle="frontTitle"
          :backtitle="backTitle"
        />
        <scheduleCardContents :user="user" :post="post" />
        <!-- <user-dialog-like :users="post.like_users" /> -->
        <user-dialog-shown :users="post.like_users" :title="title" />
      </v-col>
    </v-row>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import scheduleCardContents from '~/components/ScheduleCardContents.vue'
import buttonLike from '~/components/infoPost/ButtonLike.vue'
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'
import userDialogLike from '~/components/infoUser/UserDialogLike.vue'

export default {
  // props: {
  //   posts: {
  //     type: Array,
  //     required: true,
  //   },
  // },
  components: {
    // userPostList,
    scheduleCardContents,
    buttonLike,
    userDialogShown,
    userDialogLike,
  },
  data() {
    return {
      title: 'title',
      frontTitle: 'Hi',
      backTitle: 'Ho',
      loading: false,
      like: false,
      join: false,

      show: false,

      defaultImage: require(`@/assets/images/default.png`),
      posts: [],
    }
  },
  computed: {
    reversePosts() {
      return this.posts.slice().reverse()
    },
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      currentPosts: 'favOrNotCheck/posts',
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },
  created() {
    this.getPosts().then(() => {
      this.loading = true
    })
    this.$axios.get('api/v1/posts').then((res) => {
      this.posts = res.data
    })

    this.$axios
      .get(`api/v1/posts/${this.post.id}`)
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
          this.add = false
          this.currentPosts.forEach((f) => {
            if (f.id === this.post.id) {
              this.add = true
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
          this.add = false
          this.currentPosts.forEach((f) => {
            if (f.id === this.post.id) {
              this.add = true
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
    ...mapActions({ getPosts: 'post/getPosts' }),
    pagelink(link) {
      this.$router.push({ path: `/post/${link}` })
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
</style>
