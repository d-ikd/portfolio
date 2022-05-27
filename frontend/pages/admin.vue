<template>
  <v-container>
    <template v-if="isAdmin && isLoggedIn">
      <v-tabs v-model="tab" background-color="red lighten-4" height="60">
        <v-tabs-slider></v-tabs-slider>
        <v-tab v-for="item in items" :key="item.title">
          {{ item.title }}
        </v-tab>
      </v-tabs>
      <v-row>
        <v-col cols="12">
          <v-tabs-items v-model="tab">
            <v-tab-item>
              <all-post :posts="posts" />
            </v-tab-item>
            <v-tab-item>
              <all-message :messages="messages" />
            </v-tab-item>
            <v-tab-item>
              <all-user :users="users" />
            </v-tab-item>
            <v-tab-item>
              <store-state-check />
            </v-tab-item>
          </v-tabs-items>
        </v-col>
      </v-row>
    </template>
    <template v-else>
      このページは表示できません
      <nuxt-link to="/">トップページヘ</nuxt-link>
    </template>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex'
import allPost from '~/components/admin/AllPost.vue'
import allUser from '~/components/admin/AllUser.vue'
import allMessage from '~/components/admin/AllMessage.vue'
import StoreStateCheck from '~/components/admin/StoreStateCheck.vue'

export default {
  components: {
    allPost,
    allUser,
    allMessage,
    StoreStateCheck,
  },
  data() {
    return {
      tab: null,
      items: [
        { title: 'Post' },
        { title: 'Message' },
        { title: 'User' },
        { title: 'Store' },
      ],
      users: [],
      posts: [],
      messages: [],
    }
  },
  computed: {
    ...mapGetters({
      isAdmin: 'auth/isAdmin',
      isLoggedIn: 'auth/isLoggedIn',
    }),
  },
  created() {
    this.$axios.get('api/v1/users').then((res) => {
      console.log(res.data)
      this.users = res.data
    })
    this.$axios.get('api/v1/allpost').then((res) => {
      console.log(res.data)
      this.posts = res.data
    })
    this.$axios.get('api/v1/reviews').then((res) => {
      console.log(res.data)
      this.messages = res.data
    })
  },
  methods: {},
}
</script>
