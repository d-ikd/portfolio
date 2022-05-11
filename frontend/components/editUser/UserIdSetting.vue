<template v-if="loginUser && loginUser.id == user.id">
  <!-- <v-btn
                      v-if="follow"
                      large
                      rounded
                      min-width="125px"
                      :color="color"
                      class="font-weight-bold"
                      @click="unfollowUser"
                      @mouseover="mouseover"
                      @mouseleave="mouseleave"

                    >
                      {{ message }}
                    </v-btn>
    -->
  <v-dialog v-model="dialog" hide-overlay transition="dialog-bottom-transition">
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        color="#48A1EB"
        dark
        rounded
        outlined
        v-bind="attrs"
        v-on="on"
        min-width="125px"
        class="font-weight-bold"
      >
        Edit profile
      </v-btn>
    </template>
    <v-card>
      <v-toolbar dark color="primary">
        <v-toolbar-title>Edit profile</v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn icon dark @click="dialog = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>

      <v-subheader>User Controls</v-subheader>
      <editProfile />
      <editAvatar />
      <editEmail />
      <editPassword />
      <deleteUser />
      <v-spacer></v-spacer>

      <v-row
        class="blue lighten-4"
        style="height: 100px;"
        justify="center"
        align-content="center"
      >
        <v-btn
          rounded
          x-large
          color="#48A1EB"
          class="font-weight-bold align-center"
          min-width="125px"
          icon
          dark
          @click="dialog = false"
        >
          <v-icon>mdi-close</v-icon>
          Close
        </v-btn>
      </v-row>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapGetters } from 'vuex'
import deleteUser from '~/components/editUser/DeleteUser.vue'
import editAvatar from '~/components/editUser/EditAvatar.vue'
import editEmail from '~/components/editUser/EditEmail.vue'
import editPassword from '~/components/editUser/EditPassword.vue'
import editProfile from '~/components/editUser/EditProfile.vue'
export default {
  components: {
    deleteUser,
    editAvatar,
    editEmail,
    editPassword,
    editProfile,
  },
  data() {
    return {
      /* === Setting of dIalog === */
      dialog: false,
      notifications: false,
      sound: true,
      widgets: false,
      /* === end of Setting of dIalog === */
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
      // Post再取得時にユーザーを更新
      this.$axios.get(`api/v1/users/${this.$route.params.id}`).then((res) => {
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
          this.$store.commit('flashMessage/setMessage', ' フォローしました。', {
            root: true,
          })
          this.$store.commit('flashMessage/setType', '#48A1EB', { root: true })
          this.$store.commit('flashMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('flashMessage/setStatus', false, { root: true })
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
            'flashMessage/setMessage',
            ' フォロー解除しました。',
            { root: true }
          )
          this.$store.commit('flashMessage/setType', '#E35B4B', { root: true })
          this.$store.commit('flashMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('flashMessage/setStatus', false, { root: true })
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
