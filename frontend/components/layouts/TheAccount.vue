<template>
  <v-card class="rounded-card">
    <v-card color="basil">
      <v-card-title class="text-center justify-center py-6">
        <h1 class="font-weight-bold display-3 basil--text">
          <template>
            <div>
              <user-avatar :size="140" :user="currentUser" />
            </div>
            <div class="mx-auto text-center">
              <h3>{{ currentUser.name }}</h3>
              <p class="caption mt-1">
                <!--  {{ currentUser.email }} -->
              </p>
            </div>
            <div>
              <p class="caption">
                {{ currentUser.profile }}
              </p>
              <dialog-component3 class="mt-5" />
            </div>
          </template>
        </h1>
      </v-card-title>
      <!--
      <v-tabs v-model="tab" background-color="transparent" color="basil" grow>
        <v-tab v-for="(item, index) in items" :key="`first-${index}`">
          {{ item.title }}
        </v-tab>
      </v-tabs>
      -->
      <v-tabs v-model="tab" background-color="transparent" color="basil" grow>
        <v-tab>
          Likes
        </v-tab>
        <v-tab>
          followings
        </v-tab>
        <v-tab>
          followers
        </v-tab>
        <v-tab>
          reviews
        </v-tab>
      </v-tabs>

      <v-tabs-items v-model="tab">
        <v-tab-item>
          <!-- <v-tab-item v-for="(item, index) in items" :key="`second-${index}`"> -->
          <v-card>
            <v-card-text>
              <user-post-list :posts="loginUser.postlike" />
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-card-text>
              <list-component :lists="loginUser.followings" />
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-card-text>
              <!-- <list-component :lists="`loginUser.${listitem}`" /> -->
              <list-component :lists="loginUser.followers" />
            </v-card-text>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-card-text>
              <!-- <list-component :lists="`loginUser.${listitem}`" /> -->
              <user-review-list :reviews="loginUser.reviews" />
            </v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </v-card>

    <!--                   <user-list :users="loginUser.followings" />
                  <user-list :users="user.followers" />
                  <user-post-list :posts="user.postjoin" />
                  <user-post-list :posts="user.postlike" />
                  <user-review-list :reviews="user.reviews" />
                  <user-like-review-list :reviews="user.like_reviews" /> -->
  </v-card>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import listComponent from '~/components/layouts/ListComponent.vue'
import userReviewList from '~/components/infoUser/UserReviewList.vue'
import userPostList from '~/components/infoUser/UserPostList.vue'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import dialogComponent3 from '~/components/layouts/DialogComponent3.vue'

export default {
  components: {
    userPostList,
    userReviewList,
    listComponent,

    userAvatar,
    dialogComponent3,
  },
  data() {
    return {
      goods: [
        { id: '01', title: 'アバター変更' },
        { id: '02', title: 'ユーザーネーム変更' },
        { id: '03', title: 'メールアドレス変更' },
        { id: '04', title: 'パスワード変更' },
        { id: '05', title: 'Danger Zone' },
      ],
      dialog: false,
      defaultImage: 'http://localhost:5000/fallback/default.png',
      tab: null,
      items: [
        {
          title: 'followings',
          titletext: 'followingstext',
          listitem: 'followings',
        },
        /* { title: 'followers', titletext: 'followersstext', listitem: "loginUser.followers" }, */
      ],
      text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    }
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
      currentUser: 'auth/currentUser',
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },

  watch: {
    postUpdate() {
      // Post再取得時にユーザーを更新
      this.$axios.get(`api/v1/users/${this.loginUser.id}`).then((res) => {
        this.$store.commit('user/setUser', res.data, { root: true })
        console.log(res.data)
      })
    },
    // userUpdate() {
    //   // User情報更新時にユーザーを更新
    //   this.$axios.get(`api/v1/users/${this.$route.params.id}`).then((res) => {
    //     this.$store.commit("user/setUser", res.data, { root: true })
    //     console.log(res.data)
    //   })
    // },
  },
  created() {
    this.$axios.get(`api/v1/users/${this.loginUser.id}`).then((res) => {
      this.$store.commit('user/setUser', res.data, { root: true })
      console.log(res.data)
      this.loading = true
      if (this.loginUser) {
        this.follow = false
        this.user.followers.forEach((f) => {
          if (f.id === this.loginUser.id) {
            this.follow = true
          }
        })
      }
    })
  },
  methods: {
    ...mapActions({
      logout: 'auth/logout',
    }),
    pagelink(link) {
      this.$router.push({ path: link })
    },
    closeDialog() {
      this.dialog = false
    },

    mouseover() {
      this.color = 'red white--text'
      this.message = 'Unfollow'
    },
    mouseleave() {
      this.color = 'blue white--text'
      this.message = 'Following'
    },
    followUser() {
      this.$axios
        .post('/api/v1/relationships', {
          user_id: this.loginUser.id,
          follow_id: this.user.id,
        })
        .then(() => {
          this.$store.commit(
            'snackbarMessage/setMessage',
            ' フォローしました。',
            {
              root: true,
            }
          )
          this.$store.commit('snackbarMessage/setType', '#48A1EB', {
            root: true,
          })
          this.$store.commit('snackbarMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
          this.$axios.get(`api/v1/users/${this.user.id}`).then((res) => {
            console.log(res.data)
            this.$store.commit('user/setUser', res.data, { root: true })
            this.follow = true
            this.$axios.get(`api/v1/users/${this.loginUser.id}`).then((res) => {
              console.log(res.data)
              this.$store.commit('auth/setLoginUser', res.data, { root: true })
            })
          })
        })
        .catch((err) => {
          console.log(err)
        })
    },
    unfollowUser() {
      this.$axios
        .delete('/api/v1/relationships', {
          params: {
            user_id: this.loginUser.id,
            follow_id: this.user.id,
          },
        })
        .then(() => {
          this.$store.commit(
            'snackbarMessage/setMessage',
            ' フォロー解除しました。',
            { root: true }
          )
          this.$store.commit('snackbarMessage/setType', '#E35B4B', {
            root: true,
          })
          this.$store.commit('snackbarMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
          this.$axios.get(`api/v1/users/${this.user.id}`).then((res) => {
            console.log(res.data)
            this.$store.commit('user/setUser', res.data, { root: true })
            this.follow = false
            this.$axios.get(`api/v1/users/${this.loginUser.id}`).then((res) => {
              console.log(res.data)
              this.$store.commit('auth/setLoginUser', res.data, { root: true })
            })
          })
        })
        .catch((err) => {
          console.log(err)
        })
    },
  },
}
</script>

<style scoped>
.user-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
.user-name {
  display: flex;
  justify-content: space-between;
}
.following {
  display: flex;
}
.v-application p {
  margin-bottom: 0px;
}
.container {
  padding-bottom: 0px;
}
.rounded-card {
  border-radius: 20px;
}
</style>
