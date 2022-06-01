<template>
  <v-dialog v-model="dialog" max-width="600">
    <template #activator="{ on, attrs }">
      <v-btn
        color="blue lighten-2 white--text font-weight-bold"
        v-bind="attrs"
        v-on="on"
      >
        <v-icon>mdi-message-text-outline</v-icon>
        メッセージする
      </v-btn>
    </template>

    <v-sheet
      width="500px"
      color="transparent"
      class=" mx-auto pb-3 mb-10 rounded-card"
    >
      <v-card width="400px" class="mx-auto rounded-card">
        <v-system-bar lights-out>
          <v-spacer></v-spacer>
          <v-btn icon class="mt-5" @click="dialog = false">
            <v-icon>mdi-close</v-icon>
          </v-btn>
        </v-system-bar>
        <v-card-title class="headline justify-center">
          {{ post.name }}
        </v-card-title>
        <v-card-text>
          <v-form ref="form">
            <v-container>
              <v-text-field
                v-model="message.title"
                label="メッセージタイトルを入れてください"
              />
              <v-textarea
                v-model="message.content"
                label="メッセージ本文をいれてください"
              />
              <v-file-input
                accept="image/png, image/jpeg, image/bmp"
                label="画像"
                show-size
                @change="setImage"
              />
              <v-img
                v-if="message.image"
                :src="input_image"
                contain
                max-width="600"
                max-height="300"
              />
            </v-container>
            <v-card-actions>
              <v-btn
                x-large
                block
                color="blue lighten-2"
                class="font-weight-bold align-center"
                icon
                @click="postMessage"
              >
                <v-icon>mdi-cube-send</v-icon>
                メッセージ投稿
              </v-btn>
            </v-card-actions>
          </v-form>
        </v-card-text>
      </v-card>
    </v-sheet>
  </v-dialog>
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
      message: {
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
    ...mapActions({ messagePost: 'post/message' }),
    postMessage() {
      this.messagePost(this.message)
      this.dialog = false
    },
    setImage(file) {
      this.message.image = file
      console.log(this.message.image)
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
