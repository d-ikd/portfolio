<template>
  <div>
    <template>
      <dialogComponentContents4
        :dialog-component="dialogComponent"
        :post="post"
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
import dialogComponentContents4 from '~/components/layouts/DialogComponentContents4.vue'
export default {
  components: {
    dialogComponentContents4,
  },
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: false,
    },
  },

  data() {
    return {
      dialogComponent: false,
      dialogItems: {
        title: 'ダイアログタイトル',
        text: 'テキストテキストテキストテキストテキストテキスト',
      },
      /* message: '', */
    }
  },
  methods: {
    closeDialog() {
      this.dialog = false
    },
    response(obj) {
      /* this.message = obj.message */
      this.dialogComponent = false
    },
  },
}
</script>
