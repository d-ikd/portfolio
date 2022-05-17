<template>
  <v-dialog v-model="dialog" max-width="600">
    <template #activator="{ on, attrs }">
      <div align="center" justify="center" class="mb5">
        <v-btn
          color="green lighten-1 white--text font-weight-bold"
          v-bind="attrs"
          v-on="on"
        >
          画像アップロード
        </v-btn>
      </div>
    </template>

    <v-card>
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
            <v-file-input
              accept="image/png, image/jpeg, image/bmp"
              label="画像"
              show-size
              @change="setImage"
            />
            <v-img
              v-if="post.photoshot.url"
              :src="input_image"
              contain
              max-width="600"
              max-height="300"
            />
          </v-container>
          <v-card-actions>
            <v-btn
              color="light-green darken-1"
              class="white--text font-weight-bold pa-5 mt-3"
              block
              @click="postPhotoshot"
            >
              画像投稿
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
// import { mapActions } from 'vuex'

export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      dialog: false,
      postphoto: {
        title: '',
        content: '',
        rate: 0,
        photoshot: '',
        user_id: this.$store.state.auth.loginUser.id,
        post_id: this.post.id,
      },
      input_image: '',
    }
  },
  computed: {},
  methods: {
    setImage(e) {
      this.photoshot = e
    },
    postPhotoshot() {
      const formData = new FormData()
      formData.append('photoshot', this.photoshot)
      const config = {
        headers: {
          'content-type': 'multipart/form-data',
        },
      }
      this.$axios
        .post('api/v1/posts', formData, config)
        .then((res) => {
          console.log(res)
          console.log('Success')
          this.dialog = false
          setTimeout(() => {
            this.$store.commit('snackbarMessage/setStatus', false, {
              root: true,
            })
          }, 1000)
        })
        .catch((err) => {
          console.log(err)
          console.log('Failure')
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
