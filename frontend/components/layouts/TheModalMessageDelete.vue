<template>
  <v-dialog v-model="dialog" max-width="600">
    <template v-if="$store.state.auth.isLoggedIn" #activator="{ on, attrs }">
      <v-btn
        v-if="review.user_id === $store.state.auth.loginUser.id"
        v-bind="attrs"
        icon
        v-on="on"
      >
        <v-icon> mdi-delete </v-icon>
      </v-btn>
    </template>

    <v-card>
      <v-system-bar lights-out>
        <v-spacer></v-spacer>
        <v-btn icon class="mt-5" @click="dialog = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-system-bar>
      <v-card-title class="headline justify-center">
        投稿を削除しますか？
      </v-card-title>
      <v-card-text class="mt-3">
        この操作は取り消せません。投稿内容・投稿へのコメント・コメントに対する返信コメントが削除されます。
      </v-card-text>
      <div class="text-center">
        <v-btn
          color="red"
          class="font-weight-bold justify-center mb-2"
          text
          @click="deleteReview"
        >
          削除
        </v-btn>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>
// import { mapActions } from "vuex"

export default {
  props: {
    review: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      dialog: false,
    }
  },
  methods: {
    // ...mapActions({ deleteReview: "post/deleteReview" }),
    deleteReview() {
      this.$axios
        .delete(`api/v1/reviews/${this.review.id}`)
        .then(() => {
          this.$store.commit(
            'snackbarMessage/setMessage',
            'メッセージを削除しました。',
            { root: true }
          )
          this.$store.commit('snackbarMessage/setType', 'info', { root: true })
          this.$store.commit('snackbarMessage/setStatus', true, { root: true })
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
          this.$axios
            .get(`api/v1/posts/${this.$store.state.post.post.id}`)
            .then((res) => {
              console.log(res.data)
              this.$store.commit('post/setPost', res.data, { root: true })
              this.dialog = false
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
.signup-link {
  color: #2196f3;
  cursor: pointer;
}
.signup-link:hover {
  opacity: 0.8;
  text-decoration: underline;
}
</style>
