<template>
  <div>
    <template>
      <dialogComponentContents2
        :dialog-component="dialogComponent"
        :posting="post"
        @result="response"
      />
      <v-btn
        color="red lighten-2 white--text"
        @click.stop="dialogComponent = true"
      >
        <v-icon dark> mdi-walk </v-icon>参加ページへ
      </v-btn>
    </template>
  </div>
</template>

<script>
import dialogComponentContents2 from '~/components/layouts/DialogComponentContents2.vue'
export default {
  components: {
    dialogComponentContents2,
  },
  props: {
    isPostCreate: {
      type: Boolean,
      default: false,
    },

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
