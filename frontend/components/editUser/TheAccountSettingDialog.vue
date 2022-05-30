<template>
  <div>
    <template>
      <the-account-setting-dialog-component
        :dialog-component="dialogComponent"
        @result="response"
      />
      <!-- :is-the-account-setting="true" -->
      <v-btn color="purple" plain @click.stop="dialogComponent = true">
        <v-icon color="purple">mdi-wrench</v-icon>
        設定
      </v-btn>
    </template>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
// import deleteUser from '~/components/editUser/DeleteUser.vue'
// import editAvatar from '~/components/editUser/EditAvatar.vue'
// import editEmail from '~/components/editUser/EditEmail.vue'
// import editPassword from '~/components/editUser/EditPassword.vue'
// import editProfile from '~/components/editUser/EditProfile.vue'
// import userAvatar from '~/components/infoUser/UserAvatar.vue'
import theAccountSettingDialogComponent from '~/components/editUser/TheAccountSettingDialogComponent.vue'

export default {
  components: {
    theAccountSettingDialogComponent,
    // deleteUser,
    // editAvatar,
    // editEmail,
    // editPassword,
    // editProfile,
    // userAvatar,
  },
  props: {
    isTheAccountSetting: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      dialog: false,
      dialogComponent: false,
      defaultImage: 'http://localhost:5000/fallback/default.png',
      tab: null,
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

  /*   watch: {
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
  }, */
  /*   created() {
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
  }, */
  methods: {
    ...mapActions({
      logout: 'auth/logout',
    }),
    response() {
      /* this.message = obj.message */
      this.dialogComponent = false
    },
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
