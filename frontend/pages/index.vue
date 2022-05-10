<template>
  <div>
    <p>index</p>

    <p>auth/currentUser: {{ Getters1 }}</p>
    <p>auth/loginUser: {{ Getters2 }}</p>
    <p>auth/isLoggedIn: {{ Getters3 }}, auth/isAdmin: {{ Getters4 }}</p>
    <p>modal/loginModal: {{ Getters5 }}</p>
    <p>modal/signUpModal: {{ Getters6 }}</p>
    <!--
    <p>user/user: {{ Getters7 }}</p>

    <UserReview />
    <UserList />
    <UserLikeReview />
    <UserFollow />
    <rinrei :rinrin="number"></rinrei>
    <p>{{ GettersAll }}</p> -->
  </div>
</template>

<script>
import rinrei from '~/components/rinrei.vue'
/* import UserFollow from '~/components/infoUser/UserFollow.vue' */
/* import UserReview from '~/components/infoUser/UserReview.vue' */
/* import UserReviewList from '~/components/infoUser/UserReviewList.vue' */
/* import UserList from '~/components/infoUser/UserList.vue' */
/* import UserLikeReview from '~/components/infoUser/UserLikeReview.vue' */
import { mapGetters } from 'vuex'
export default {
  data() {
    return {
      number: 18,
    }
  },
  components: {
    rinrei,
    /*     UserFollow,
    UserList,
    UserReview,
    UserReviewList,
    UserLikeReview, */
  },
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
    GettersAll() {
      return this.$store.getters
    },
  },
  methods: {
    async getSomething() {
      // タスク一覧を取得するための API を叩く
      const response = await this.$axios.$get('api/v1/users')
      this.users = JSON.parse(response.users)
    },
  },
}
</script>

<style scoped>
div {
  border: 5px solid yellow;
}
</style>
