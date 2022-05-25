<template>
  <v-sheet class="rounded-card" elevation="5">
    <v-card-text>
      <v-form ref="form">
        <v-container>
          <v-text-field v-model="review.title" label="タイトル" />
          <v-textarea v-model="review.content" label="メッセージ" />
          <v-file-input
            accept="image/png, image/jpeg, image/bmp"
            label="画像"
            show-size
            @change="setImage"
          />
          <v-img
            v-if="review.image"
            :src="input_image"
            contain
            max-width="600"
            max-height="300"
          />
        </v-container>
        <v-card-actions>
          <v-btn
            color="#67AC5B"
            class="white--text font-weight-bold pa-5 mt-3"
            block
            @click="postReview"
          >
            新規投稿
          </v-btn>
        </v-card-actions>
      </v-form>
    </v-card-text>
  </v-sheet>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      dialog: false,
      review: {
        title: '',
        content: '',
        rate: 0,
        image: '',
        user_id: this.$store.state.auth.loginUser.id,
        post_id: this.post.id,
      },
      input_image: '',
    }
  },
  computed: {},
  methods: {
    ...mapActions({ reviewPost: 'post/review' }),
    postReview() {
      this.reviewPost(this.review)
      this.dialog = false
    },
    setImage(file) {
      this.review.image = file
      console.log(this.review.image)
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
          this.input_image = fr.result
        })
      } else {
        this.input_image = ''
      }
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.signup-link {
  color: #2196f3;
  cursor: pointer;
}
.signup-link:hover {
  opacity: 0.8;
  text-decoration: underline;
}
</style>
