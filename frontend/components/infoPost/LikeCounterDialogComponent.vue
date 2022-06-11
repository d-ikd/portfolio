<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialogComponent"
      hide-overlay
      transition="dialog-bottom-transition"
      max-width="600"
      persistent
    >
      <v-row no-gutters>
        <v-col> </v-col>
        <v-col cols="sm" class="text-center align-self-center">
          <v-sheet elevation="4" class="rounded-pill">
            <template>
              <v-chip
                label
                color="transparent"
                x-large
                outlined
                text-color="purple"
              >
                <v-icon class="ml-2 mr-2">mdi-account-circle</v-icon>
                参加メンバー
              </v-chip>
            </template>
          </v-sheet>
        </v-col>
        <v-col>
          <button-close @close-dialog="closeDialog" />
        </v-col>
      </v-row>

      <v-card
        color="basil"
        width="500px"
        class=" mx-auto pb-3 mb-13 rounded-card"
      >
        <v-list rounded color="white">
          <v-subheader class="black--text"
            >参加メンバー（{{ users.length }}）</v-subheader
          >
          <v-list-item-group>
            <v-list-item v-for="user in users" :key="user.id" :ripple="false">
              <nuxt-link :to="{ path: `/users/${user.id}` }">
                <user-avatar :size="40" :user="user" class="list-avatar mx-3" />
              </nuxt-link>

              <v-list-item-content>
                <v-list-item-title
                  class="black--text list-item"
                  @click="pagelink(user.id)"
                >
                  {{ user.name }}
                </v-list-item-title>
              </v-list-item-content>
              <user-follow :user="user" />
            </v-list-item>
          </v-list-item-group>
        </v-list>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userFollow from '~/components/infoUser/UserFollow.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'

export default {
  components: {
    userAvatar,
    userFollow,
    buttonClose,
  },
  props: {
    dialogComponent: {
      type: Boolean,
      default: false,
    },
    users: {
      type: Array,
      required: true,
    },
    post: {
      type: Object,
      default: () => ({}),
      required: true,
    },
    icon: {
      type: Boolean,
      required: false,
    },
  },
  data() {
    return {
      dialog: false,
      likeList: [],
    }
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
    /*      likeCount() {
      return this.post.like_users.length
    }, */
    /*
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },
  watch: {
    postUpdate() {
      // POST再取得時にユーザーを更新
      this.$axios.get(`api/v1/posts/${this.$post.id}`).then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
        console.log(res.data)
      })
    },
    postUpdate() {
      // POST再取得時にユーザーを更新
      this.$axios.get(`api/v1/users/${this.$post.id}`).then((res) => {
        this.$store.commit('user/setUser', res.data, { root: true })
        console.log(res.data)
      })
    },
    // userUpdate() {
    //   // ユーザー情報更新時にユーザーを更新
    //   this.$axios.get(`api/v1/users/${this.$route.params.id}`).then((res) => {
    //     this.$store.commit("user/setUser", res.data, { root: true })
    //     console.log(res.data)
    //   })
    // }, */
    /*
  watch: {
    count() {
      return this.post.like_users.length
    },
  },
  mounted() {
      return this.post.like_users.length
  },
    },
    // ログインユーザが既にいいねしているかを判定する
  //   isLiked() {
  //     if (this.likeList.length === 0) {
  //       return false
  //     }
  //     return Boolean(this.findLikeId())
  //   },
  // }, */
    /*
methods: {
        pagelink(link) {
      this.$router.push({ path: `/users/${link}` })
    }, */

    methods: {
      closeDialog() {
        this.$emit('result', { res: true, message: '' })
      },
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
</style>
