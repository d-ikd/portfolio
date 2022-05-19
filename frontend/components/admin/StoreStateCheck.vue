<template>
  <div>
    <p>tab/search: {{ Getters14 }}</p>
    <p>auth/currentUser: {{ Getters1 }}</p>
    <p>auth/loginUser: {{ Getters2 }}</p>
    <p>auth/isLoggedIn: {{ Getters3 }}, auth/isAdmin: {{ Getters4 }}</p>
    <p>modal/loginModal: {{ Getters5 }}</p>
    <p>modal/signUpModal: {{ Getters6 }}</p>
    <hr />
    <p>post/post: {{ Getters8 }}</p>
    <p>post/posts: {{ Getters9 }}</p>
    <p>post/getPosts: {{ Getters12 }}</p>
    <p>post/likePost: {{ Getters13 }}</p>

    <p>user/user: {{ Getters7 }}</p>
  </div>
</template>

<script>
export default {
  computed: {
    Getters1() {
      return this.$store.getters['auth/currentUser']
    },
    Getters2() {
      return this.$store.getters['auth/loginUser']
    },
    Getters3() {
      return this.$store.getters['auth/isLoggedIn']
    },
    Getters4() {
      return this.$store.getters['auth/isAdmin']
    },
    Getters5() {
      return this.$store.getters['modal/loginModal']
    },
    Getters6() {
      return this.$store.getters['modal/signUpModal']
    },
    Getters7() {
      return this.$store.getters['user/user']
    },
    Getters8() {
      return this.$store.getters['post/post']
    },
    Getters9() {
      return this.$store.getters['post/posts']
    },
    Getters12() {
      return this.$store.getters['post/getPosts']
    },
    Getters13() {
      return this.$store.getters['post/likePost']
    },
    Getters14() {
      return this.$store.getters['tab/search']
    },

    GettersAll() {
      return this.$store.getters
    },
  },
}
</script>
