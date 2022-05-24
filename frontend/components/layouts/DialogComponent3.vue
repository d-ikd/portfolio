<template>
  <div>
    <template v-if="isMessageList">
      <dialogComponentContents3
        :dialog-component="dialogComponent"
        :is-message-list="true"
        :posting="post"
        @result="response"
      />
      <v-btn
        color="purple white--text"
        outlined
        @click.stop="dialogComponent = true"
      >
        <v-icon dark>mdi-email-variant </v-icon>
        メッセージボックス
      </v-btn>
    </template>
    <template v-else-if="isAccountSetting">
      <dialogComponentContents3
        :dialog-component="dialogComponent"
        :is-account-setting="true"
        @result="response"
      />
      <v-btn
        color="purple white--text"
        outlined
        @click.stop="dialogComponent = true"
      >
        <v-icon dark> mdi-wrench </v-icon>設定
      </v-btn>
    </template>
    <template v-else>
      <dialogComponentContents3
        :dialog-component="dialogComponent"
        @result="response"
      />
      <v-btn
        color="purple white--text"
        outlined
        @click.stop="dialogComponent = true"
      >
        <v-icon dark> mdi-wrench </v-icon>設定
      </v-btn>
    </template>
  </div>
</template>

<script>
import dialogComponentContents3 from '~/components/layouts/DialogComponentContents3.vue'

export default {
  components: {
    dialogComponentContents3,
  },
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isMessageList: {
      type: Boolean,
      default: false,
    },
    isAccountSetting: {
      type: Boolean,
      default: false,
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
