<template>
  <div>
    <template>
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
