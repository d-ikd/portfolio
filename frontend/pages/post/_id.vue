<template>
  <div style="background-color: white">
    <postParallax :post="post" class="mt-8" />
    <post-container-like class="g-8" />
    <post-container-message class="mb-8" />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import postParallax from '~/components/infoPost/PostParallax.vue'
import postContainerMessage from '~/components/infoPost/PostContainerMessage.vue'
import postContainerLike from '~/components/infoPost/PostContainerLike.vue'

export default {
  name: 'MeetWithKids',
  components: {
    postParallax,
    postContainerMessage,
    postContainerLike,
  },
  data() {
    return {
      loading: false,

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

  created() {
    this.$axios.get(`api/v1/posts/${this.$route.params.id}`).then((res) => {
      this.$store.commit('post/setPost', res.data, { root: true })
    })
    this.loading = true
  },
  methods: {},
}
</script>

<style scoped>
.show-rate {
  font-size: 20px;
  font-weight: 200;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>
