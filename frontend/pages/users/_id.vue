<template>
  <div>
    <v-app-bar color="#B0DFC1">
      <nuxt-link to="/" class="link">
        <v-toolbar-title class="headertitle">Stuctive</v-toolbar-title>
      </nuxt-link>
      <v-spacer />
    </v-app-bar>

    <!-- ========== Profile ========== -->
    <template v-if="loading">
      <!--       <v-parallax
        :src="require(`@/assets/images/aomori.jpg`)"
      ></v-parallax> -->
      <v-card> </v-card>
      <v-card>
        <v-row class="mx-1 pb-10" no-gutters>
          <v-col cols="2" class="text-center">
            <user-avatar :size="100" :user="user" class="mx-auto" />
          </v-col>
          <v-col cols="10">
            <v-sheet>
              <div class="user-name mt-3">
                <h2 class="display-1">
                  {{ user.name }}
                </h2>
                <template v-if="loginUser && loginUser.id == user.id">
                  <div class="pr-10">
                    <v-dialog v-model="dialog" max-width="600">
                      <template #activator="{ on, attrs }">
                        <v-btn color="purple" v-bind="attrs" v-on="on" outlined>
                          <v-icon color="purple">mdi-wrench</v-icon>
                          設定
                        </v-btn>
                      </template>
                      <v-card width="400px" class="mx-auto rounded-card">
                        <v-system-bar lights-out>
                          <v-spacer></v-spacer>
                          <v-btn icon class="mt-5" @click="dialog = false">
                            <v-icon>mdi-close</v-icon>
                          </v-btn>
                        </v-system-bar>
                        <the-account-setting />
                      </v-card>
                    </v-dialog>
                  </div>
                </template>

                <template v-if="loginUser && loginUser.id !== user.id">
                  <div class="pr-10">
                    <v-btn
                      v-if="follow"
                      rounded
                      min-width="125px"
                      :color="color"
                      class="font-weight-bold"
                      style="text-transform: none"
                      @click="unfollowUser"
                      @mouseover="mouseover"
                      @mouseleave="mouseleave"
                    >
                      {{ message }}
                    </v-btn>
                    <v-btn
                      v-else
                      rounded
                      min-width="125px"
                      color="blue"
                      style="text-transform: none"
                      class="font-weight-bold"
                      @click="followUser"
                    >
                      <v-icon class="mr-2"> mdi-account-plus </v-icon>
                      Follow
                    </v-btn>
                  </div>
                </template>
              </div>
              <p class="subtitle-1 my-3">{{ user.profile }}</p>
              <div class="following pt-2">
                <p>
                  <span class="font-weight-bold">
                    {{ user.followings.length }}
                  </span>
                  フォロー
                </p>
                <p class="ml-3">
                  <span class="font-weight-bold">
                    {{ user.followers.length }}
                  </span>
                  フォロワー
                </p>
              </div>
            </v-sheet>
          </v-col>
        </v-row>
        <v-divider />

        <v-tabs v-model="tab" background-color="transparent" color="basil" grow>
          <v-tab v-for="item in items" :key="item.title">
            {{ item.title }}
          </v-tab>
        </v-tabs>
      </v-card>
    </template>
    <!-- ========== Profile ========== -->

    <!-- ========== Tabs ========== -->
    <v-container class="px-13">
      <v-row>
        <v-col cols="12">
          <v-tabs-items v-model="tab">
            <v-tab-item>
              <user-post-list :posts="user.postjoin" />
            </v-tab-item>
            <v-tab-item>
              <user-post-list :posts="user.postlike" />
            </v-tab-item>
            <v-tab-item>
              <user-message-list :messages="user.reviews" />
            </v-tab-item>
            <v-tab-item>
              <user-list :users="user.followings" />
            </v-tab-item>
            <v-tab-item>
              <user-list :users="user.followers" />
            </v-tab-item>
          </v-tabs-items>
        </v-col>
      </v-row>
    </v-container>
    <!-- ========== Tabs ========== -->
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userPostList from '~/components/infoUser/UserPostList.vue'
import userList from '~/components/infoUser/UserList.vue'
import userMessageList from '~/components/infoUser/UserMessageList.vue'
import userLikeReviewList from '~/components/infoUser/UserLikeReviewList.vue'
import theAccountSetting from '~/components/editUser/TheAccountSetting.vue'

export default {
  name: 'Stuctive',
  components: {
    userAvatar,
    userPostList,
    userList,
    userMessageList,
    userLikeReviewList,
    theAccountSetting,
  },
  data() {
    return {
      // user: {},
      dialog: false,
      loading: false,
      tab: null,
      follow: false,
      message: 'フォロー中',
      color: 'blue white--text',
      items: [
        { title: '参加する' },
        { title: 'いいね' },
        { title: 'レビュー' },
        { title: 'フォロー' },
        { title: 'フォロワー' },
      ],
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
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },
  watch: {
    postUpdate() {
      // POST再取得時にユーザーを更新
      this.$axios.get(`api/v1/users/${this.$route.params.id}`).then((res) => {
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
    // },
  },
  created() {
    this.$axios.get(`api/v1/users/${this.$route.params.id}`).then((res) => {
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
