<template>
  <div>
    <template v-if="isMessageCreate">
      <dialogComponentContentsAboutMessage
        :dialog-component="dialogComponent"
        :is-message-create="true"
        @result="response"
      />
      <v-btn
        color="#BADEC3"
        dark
        x-large
        class="ma-10"
        @click.stop="dialogComponent = true"
      >
        メッセージ
        <v-icon color="white">mdi-pencil</v-icon>
      </v-btn>
    </template>
    <template v-if="isMessageEdit">
      <dialogComponentContentsAboutMessage
        :dialog-component="dialogComponent"
        :is-message-edit="true"
        @result="response"
      />
      <v-btn
        color="#BADEC3"
        dark
        x-large
        class="ma-10"
        @click.stop="dialogComponent = true"
      >
        編集
        <v-icon color="white">mdi-pencil</v-icon>
      </v-btn>
    </template>
    <template v-if="isMessageDelete">
      <dialogComponentContentsAboutMessage
        :dialog-component="dialogComponent"
        :is-message-delete="true"
        @result="response"
      />
      <v-btn
        color="#BADEC3"
        dark
        x-large
        class="ma-10"
        @click.stop="dialogComponent = true"
      >
        削除
        <v-icon color="white">mdi-pencil</v-icon>
      </v-btn>
    </template>
    <template v-else>
      <dialogComponentContents
        :dialog-component="dialogComponent"
        @result="response"
      />
      <v-btn color="primary" dark @click.stop="dialogComponent = true">
        Open Dialog
      </v-btn>
    </template>
    <!-- <p class="mt-1 text-danger">{{ message }}</p> -->
  </div>
</template>

<script>
import dialogComponentContentsAboutMessage from '~/components/layouts/DialogComponentContentsAboutMessage.vue'
export default {
  components: {
    dialogComponentContentsAboutMessage,
  },
  props: {
    dialogComponent: {
      type: Boolean,
      default: false,
    },

    post: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isMessageCreate: {
      type: Boolean,
      default: false,
    },
    isMessageEdit: {
      type: Boolean,
      default: false,
    },
    isMessageDelete: {
      type: Boolean,
      default: false,
    },
  },

  methods: {
    closeDialog() {
      this.dialog = false
    },
    response() {
      /* this.message = obj.message */
      this.dialogComponent = false
    },
  },
}
</script>
