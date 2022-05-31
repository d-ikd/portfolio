<template>
  <div>
    <template v-if="loading">
      <v-app-bar color="#7a99cf">
        <nuxt-link to="/" class="link">
          <v-toolbar-title class="headertitle">Stuctive</v-toolbar-title>
        </nuxt-link>
        <v-spacer />
        <template v-if="user.id == post.user_id">
          <the-modal-post-edit :post="post" />
          <the-modal-post-delete :post="post" />
        </template>
        <template v-if="login">
          <dialog-component :is-account-page="true" class="mt-5" />
        </template>
      </v-app-bar>

      <v-sheet color="transparent" class="rounded-card align-center">
        <v-row no-gutters class="">
          <v-col> </v-col>
          <v-col cols="sm" class="text-center align-self-center">
            <v-sheet class="rounded-pill">
              <template>
                <v-chip
                  label
                  color="white"
                  large
                  outlined
                  text-color="red"
                  class="headertitle mt-10 mb-n5"
                >
                  <v-icon x-large>mdi-run</v-icon> {{ post.name }}
                </v-chip>
              </template>
            </v-sheet>

            <v-img
              v-if="post.image.url"
              :src="post.image.url"
              class="rounded-card text-center rounded-card mt-10 elevation-10"
              width="600"
            >
            </v-img>
            <v-img v-else contain :src="defaultImage"> </v-img>
            <v-sheet style="position: relative;">
              <button-like
                :user="loginUser"
                :post="post"
                :is-rounded-like="true"
              />
            </v-sheet>
          </v-col>
          <v-col> </v-col>
        </v-row>
      </v-sheet>

      <v-row>
        <v-col class="text-center mt-10">
          <template v-if="post.messages.length === 0">
            <h4 class="ma-3">メッセージがありません</h4>
            <the-modal-message-create v-if="login" :post="post" />
          </template>
          <template v-else>
            <post-message-list :messages="post.messages" />
            <the-modal-message-create
              v-if="message"
              :post="post"
              class="mt-5"
            />
          </template>
        </v-col>
      </v-row>

      <div class="mt-10">
        <post-member :users="post.join_users" :title="title" :post="post" />
        <button-like
          :is-rounded-join="true"
          :post="post"
          :user="user"
          class="text-center align-self-center"
        />
      </div>

      <div class="text-center align-self-center mt-10 mb-10">
        <v-btn
          color="purple x-large white--text"
          outlined
          nuxt
          to="/"
          class="link"
        >
          <v-icon dark>mdi-email-variant </v-icon>TOPに戻る
        </v-btn>
      </div>
    </template>
    <v-footer
      class="elevation-10 footertitle flex justify-center mt-5"
      color="#7a99cf"
      absolute
    >
      <div class="white--text">
        &copy; {{ new Date().getFullYear() }}<span class="ml-2">Stuctive</span>
      </div>
    </v-footer>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import postMessageList from '~/components/infoPost/PostMessageList.vue'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import postMember from '~/components/infoPost/PostMember.vue'
/* import listComponent from '~/components/layouts/ListComponent.vue' */
/* import postAlbum from '~/components/infoPost/postAlbum.vue' */
import theModalMessageCreate from '~/components/layouts/TheModalMessageCreate.vue'
import dialogComponent from '~/components/layouts/DialogComponent.vue'
import theModalPostDelete from '~/components/layouts/TheModalPostDelete.vue'
import theModalPostEdit from '~/components/layouts/TheModalPostEdit.vue'
// import postMessage from '~/components/infoPost/PostMessage.vue'

export default {
  components: {
    postMessageList,
    buttonLike,
    postMember,
    theModalMessageCreate,
    /* listComponent, */
    /* postAlbum, */
    dialogComponent,
    theModalPostDelete,
    theModalPostEdit,
    // postMessage,
  },
  data() {
    return {
      title: '参加メンバー',
      loading: false,
      like: false,
      join: false,
      message: true,
      createDate: '',
      releaseDate: '',
      start_time: '',
      finish_time: '',
      defaultImage: require('@/assets/images/default-user.png'),
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserMessage() {
      return this.$store.state.post.post
    },
  },
  watch: {
    loginUserMessage() {
      // ユーザーがすでにレビューを投稿してたら非表示にする
      if (this.login) {
        this.message = true
        this.post.messages.forEach((f) => {
          if (f.user_id === this.user.id) {
            this.message = false
          }
        })
      }
    },
  },
  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        // ユーザーがログインしてたらlikeしているか確認
        if (this.login) {
          this.post.like_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.like = true
            }
          })
        }
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
            }
          })
        }
        this.createDate = this.$dayjs(this.post.updated_at).format(
          'YYYY年MM月DD日'
        )
        this.releaseDate = this.$dayjs(this.post.release).format('YYYY/MM/DD')
        this.releaseYear = this.$dayjs(this.post.release).format('YYYY')
        this.releaseMonth = this.$dayjs(this.post.release).format('MM')
        this.releaseDay = this.$dayjs(this.post.release).format('DD')
        this.start_time = this.$dayjs(this.post.start_time).format('hh:mm')
        this.finish_time = this.$dayjs(this.post.finish_time).format('hh:mm')
        this.loading = true
      })
  },
  methods: {
    ...mapActions({
      likePost: 'post/likePost',
      unLikePost: 'post/unLikePost',
      joinPost: 'post/joinPost',
      unJoinPost: 'post/unJoinPost',
    }),
  },
}
</script>

<style scoped>
.headertitle {
  color: white;
  font-size: 40px;
  font-family: 'Fraunces', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
.link {
  text-decoration: none;
}
.footertitle {
  color: white;
  font-size: 16px;
  font-family: 'Fraunces', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
</style>
