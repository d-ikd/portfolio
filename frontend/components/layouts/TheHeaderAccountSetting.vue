<template>
  <div>
    <v-dialog transition="dialog-bottom-transition" max-width="600">
      <template v-slot:activator="{ on, attrs }">
        <v-btn transparent v-bind="attrs" v-on="on"
          ><v-icon>mdi-dots-vertical</v-icon>
        </v-btn>
      </template>
      <template v-slot:default="dialog">
        <v-card>
          <v-toolbar color="white black--text" dark extended prominent>
            <v-toolbar-title class="d-flex"></v-toolbar-title>
            <v-spacer></v-spacer>
            <template>
              <div>
                <user-avatar :size="100" :user="currentUser" />
              </div>
              <div class="mx-auto ml-7 text-center">
                <h3>{{ currentUser.name }}</h3>
                <p class="caption mt-1">
                  {{ currentUser.email }}
                </p>
              </div>
              <div class="ml-14">
                <p class="caption">
                  {{ currentUser.profile }}
                </p>
              </div>
            </template>

            <v-spacer></v-spacer>
            <v-btn text color="black" @click="dialog.value = false">
              <v-icon>mdi-close-box-outline</v-icon>
            </v-btn>
          </v-toolbar>

          <v-row justify="center">
            <v-expansion-panels inset color="white">
              <v-expansion-panel>
                <v-expansion-panel-header>
                  followings
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <user-list :users="loginUser.followings" />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header>
                  followers
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <user-list :users="user.followers" />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header>
                  postjoin
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <user-post-list :posts="user.postjoin" />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header>
                  postlike
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <user-post-list :posts="user.postlike" />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header>
                  レビューリスト
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <user-review-list :reviews="user.reviews" />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header>
                  レビューリスト２
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <user-like-review-list :reviews="user.like_reviews" />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header>
                  アバター変更
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <editAvatar />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header
                  >ユーザーネーム変更</v-expansion-panel-header
                >
                <v-expansion-panel-content>
                  <editProfile />
                </v-expansion-panel-content>
              </v-expansion-panel>

              <v-expansion-panel>
                <v-expansion-panel-header
                  >パスワード変更</v-expansion-panel-header
                >
                <v-expansion-panel-content>
                  <editPassword />
                </v-expansion-panel-content>
              </v-expansion-panel>
              <v-expansion-panel>
                <v-expansion-panel-header
                  >メールアドレス変更</v-expansion-panel-header
                >
                <v-expansion-panel-content>
                  <editEmail />
                </v-expansion-panel-content>
              </v-expansion-panel>
              <v-expansion-panel>
                <v-expansion-panel-header class="red--text"
                  >Danger Zone</v-expansion-panel-header
                >
                <v-expansion-panel-content>
                  <deleteUser />
                </v-expansion-panel-content>
              </v-expansion-panel>
            </v-expansion-panels>
          </v-row>

          <v-list-item-content class="justify-center">
            <div class="mx-auto text-center">
              <v-divider class="my-3"></v-divider>

              <v-divider class="my-3"></v-divider>
              <v-btn
                v-if="currentUser.admin"
                depressed
                rounded
                text
                to="/admin"
                @click="dialog.value = false"
              >
                管理者機能
              </v-btn>

              <v-divider v-if="currentUser.admin" class="my-3"></v-divider>
              <v-btn depressed rounded text @click="logout"> ログアウト </v-btn>
            </div>
          </v-list-item-content>
        </v-card>

        <v-card>
          <v-spacer></v-spacer>
        </v-card>
      </template>
    </v-dialog>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import userList from '~/components/infoUser/UserList.vue'
import userPostList from '~/components/infoUser/UserPostList.vue'

import userAvatar from '~/components/infoUser/UserAvatar.vue'

import deleteUser from '~/components/editUser/DeleteUser.vue'
import editAvatar from '~/components/editUser/EditAvatar.vue'
import editEmail from '~/components/editUser/EditEmail.vue'
import editPassword from '~/components/editUser/EditPassword.vue'
import editProfile from '~/components/editUser/EditProfile.vue'

export default {
  components: {
    userList,
    userPostList,

    userAvatar,
    deleteUser,
    editAvatar,
    editEmail,
    editPassword,
    editProfile,
  },
  data() {
    return {
      expand: false,
      show: false,
      defaultImage: 'http://localhost:5000/fallback/default.png',
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
</style>
