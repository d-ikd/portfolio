<template>
  <div>
    <template v-if="isMessageCreate">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        @result="response"
        :is-message-create="true"
      />
      <v-btn
        color="#BADEC3"
        dark
        x-large
        class="ma-10"
        @click.stop="dialogComponent = true"
      >
        メッセージする
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
import dialogComponentContents from '~/components/layouts/DialogComponentContents.vue'
export default {
  components: {
    dialogComponentContents,
  },
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isMessageCreate: {
      type: Boolean,
      default: false,
      required: false,
    },
  },

  data() {
    return {
      dialogComponent: false,
      /* message: '', */
    }
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
