<template>
  <v-row>
    <v-dialog
      v-model="editDialog"
      hide-overlay
      transition="dialog-bottom-transition"
      max-width="600"
      persistent
    >
      <template #activator="{ on: dialog, attrs }">
        <v-tooltip top>
          <template
            v-if="$store.state.auth.isLoggedIn"
            #activator="{ on: tooltip }"
          >
            <v-btn
              v-if="message.user_id === $store.state.auth.loginUser.id"
              v-bind="attrs"
              icon
              v-on="{ ...dialog, ...tooltip }"
            >
              <v-icon> mdi-comment-edit </v-icon>
            </v-btn>
          </template>
          <span>メッセージ編集</span>
        </v-tooltip>
      </template>

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
                text-color="green"
              >
                <v-icon class="ml-2 mr-2">mdi-pencil</v-icon>
                ページを編集する
              </v-chip>
            </template>
          </v-sheet>
        </v-col>
        <v-col>
          <v-spacer></v-spacer>
          <v-btn color="#BDBDBD88" fab dark x-large @click="editDialog = false">
            <v-icon color="white"> mdi-close-circle-outline</v-icon>
          </v-btn>
        </v-col>
      </v-row>

      <v-sheet
        width="500px"
        color="transparent"
        class=" mx-auto pb-3 mb-10 rounded-card"
      >
        <v-card width="400px" class="mx-auto rounded-card">
          <v-card-title class="headline justify-center">
            {{ message.post.name }}
          </v-card-title>
          <v-card-text>
            <v-form ref="form">
              <v-container>
                <v-text-field
                  v-model="messageEdit.title"
                  label="タイトル記入"
                />
                <v-textarea
                  v-model="messageEdit.content"
                  label="メッセージ記入"
                />
                <v-file-input
                  v-model="messageEdit.image"
                  accept="image/png, image/jpeg, image/bmp"
                  label="画像"
                  show-size
                  @change="setImage"
                />
                <template v-if="message.image.url">
                  <v-img
                    v-if="input_image !== null"
                    :src="input_image"
                    contain
                    max-width="600"
                    max-height="300"
                  />
                  <v-img
                    v-else
                    :src="message.image.url"
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
                  @click="postMessageEdit"
                >
                  更新
                </v-btn>
              </v-card-actions>
            </v-form>
          </v-card-text>
        </v-card>
      </v-sheet>
      <v-sheet class="d-flex justify-center transparent">
        <v-btn
          transparent
          color="white"
          class="pink--text font-weight-bold mt-n10 mb-2"
          min-width="125px"
          @click="editDialog = false"
        >
          <v-icon>mdi-window-close</v-icon>
          閉じる
        </v-btn>
      </v-sheet>
    </v-dialog>
  </v-row>
</template>

<script>
import { mapActions } from 'vuex'
/* import buttonChange from '~/components/layouts/ButtonChange.vue' */

export default {
  props: {
    message: {
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
      messageEdit: {
        title: this.message.title,
        content: this.message.content,
        rate: this.message.rate,
        image: this.message.image,
        user_id: this.message.user_id,
        post_id: this.message.post_id,
        messageId: this.message.id,
      },
      input_image: null,
    }
  },
  computed: {},
  methods: {
    ...mapActions({ editMessage: 'post/editMessage' }),
    postMessageEdit() {
      this.editMessage(this.messageEdit)
      this.editDialog = false
    },
    setImage(file) {
      this.messageEdit.image = file
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
