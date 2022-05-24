<template>
  <v-card>
    <v-system-bar lights-out>
      <v-spacer></v-spacer>
      <v-btn icon class="mt-5" @click="editDialog = false">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-system-bar>
    <v-card-title class="headline justify-center">
      {{ review.post.name }}
    </v-card-title>
    <v-card-text>
      <v-form ref="form">
        <v-container>
          <!--             <div class="d-flex align-center my-2">
              <v-rating
                v-model="reviewEdit.rate"
                background-color="orange lighten-1"
                color="orange darken-2"
                half-increments
                class="ml-5"
                dense
                large
                hover
              />
              <span class="ml-5 font-weight-bold">
                {{ reviewEdit.rate }}
              </span>
            </div> -->
          <v-text-field v-model="reviewEdit.title" label="タイトル記入" />
          <v-textarea v-model="reviewEdit.content" label="メッセージ記入" />
          <v-file-input
            v-model="reviewEdit.image"
            accept="image/png, image/jpeg, image/bmp"
            label="画像"
            show-size
            @change="setImage"
          />
          <template v-if="review.image.url">
            <v-img
              v-if="input_image !== null"
              :src="input_image"
              contain
              max-width="600"
              max-height="300"
            />
            <v-img
              v-else
              :src="review.image.url"
              contain
              max-width="600"
              max-height="300"
            />
          </template>
          <template v-else>
            <v-img
              v-if="input_image"
              :src="input_image"
              contain
              max-width="600"
              max-height="300"
            />
          </template>
        </v-container>
        <v-card-actions>
          <v-btn
            color="light-green darken-1"
            class="white--text font-weight-bold pa-5 mt-3"
            block
            @click="postReviewEdit"
          >
            更新
          </v-btn>
        </v-card-actions>
      </v-form>
    </v-card-text>
  </v-card>
</template>

<script>
import { mapActions } from 'vuex'
/* import buttonChange from '~/components/layouts/ButtonChange.vue' */

export default {
  props: {
    review: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  component: {
    /* buttonChange, */
  },
  data() {
    return {
      editDialog: false,
      reviewEdit: {
        title: this.review.title,
        content: this.review.content,
        rate: this.review.rate,
        image: this.review.image,
        user_id: this.review.user_id,
        post_id: this.review.post_id,
        reviewId: this.review.id,
      },
      input_image: null,
    }
  },
  computed: {},
  methods: {
    ...mapActions({ editReview: 'post/editReview' }),
    postReviewEdit() {
      this.editReview(this.reviewEdit)
      this.editDialog = false
    },
    setImage(file) {
      this.reviewEdit.image = file
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
        this.input_image = null
      }
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
