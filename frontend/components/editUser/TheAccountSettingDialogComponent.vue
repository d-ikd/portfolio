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
                設定
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
              </div>
            </template>
          </h1>
        </v-card-title>

        <div>
          <v-expansion-panels color="black">
            <v-expansion-panel>
              <v-expansion-panel-header>
                アバター変更
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                <edit-avatar />
              </v-expansion-panel-content>
            </v-expansion-panel>
            <v-expansion-panel>
              <v-expansion-panel-header>
                ユーザーネーム変更
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                <edit-profile />
              </v-expansion-panel-content>
            </v-expansion-panel>

            <v-expansion-panel>
              <v-expansion-panel-header>
                パスワード変更
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                <edit-password />
              </v-expansion-panel-content>
            </v-expansion-panel>
            <v-expansion-panel>
              <v-expansion-panel-header
                >メールアドレス変更</v-expansion-panel-header
              >
              <v-expansion-panel-content>
                <edit-email />
              </v-expansion-panel-content>
            </v-expansion-panel>
            <v-expansion-panel>
              <v-expansion-panel-header class="red--text">
                Danger Zone
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                <deleteUser />
              </v-expansion-panel-content>
            </v-expansion-panel>
          </v-expansion-panels>
        </div>
        <v-list>
          <v-list-item-content class="justify-center">
            <div class="mx-auto text-center">
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
        </v-list>
      </v-card>

      <v-sheet class="d-flex justify-center transparent">
        <v-btn
          transparent
          color="white"
          class="pink--text font-weight-bold mt-n10 mb-2"
          min-width="125px"
          @click="closeDialog"
        >
          <v-icon>mdi-window-close</v-icon>
          閉じる
        </v-btn>
      </v-sheet>
    </v-dialog>
  </v-row>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import deleteUser from '~/components/editUser/DeleteUser.vue'
import editAvatar from '~/components/editUser/EditAvatar.vue'
import editEmail from '~/components/editUser/EditEmail.vue'
import editPassword from '~/components/editUser/EditPassword.vue'
import editProfile from '~/components/editUser/EditProfile.vue'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'

export default {
  components: {
    buttonClose,
    deleteUser,
    editAvatar,
    editEmail,
    editPassword,
    editProfile,
    userAvatar,
  },
  props: {
    dialogComponent: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      dialog: false,
      defaultImage: 'http://localhost:5000/fallback/default.png',
      tab: null,
      items: [
        {
          title: 'followings',
          titletext: 'followingstext',
          listitem: 'followings',
        },
      ],
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
    pagelink(link) {
      this.$router.push({ path: link })
    },
    closeDialog() {
      this.$emit('result', { res: true, message: '' })
    },

    mouseover() {
      this.color = 'red white--text'
      this.message = 'Unfollow'
    },
    mouseleave() {
      this.color = 'blue white--text'
      this.message = 'Following'
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
