<template>
  <div>
    <template>
      <info-dialog-component-contents
        :dialog-component="dialogComponent"
        :posting="post"
        @result="response"
      />
      <v-btn
        color="purple"
        rounded
        small
        icon
        @click.stop="dialogComponent = true"
      >
        <v-icon color="blue">
          mdi-walk
        </v-icon>
      </v-btn>
    </template>
  </div>
</template>

<script>
import infoDialogComponentContents from '~/components/infoUser/infoDialogComponentContents.vue'
export default {
  components: {
    infoDialogComponentContents,
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
