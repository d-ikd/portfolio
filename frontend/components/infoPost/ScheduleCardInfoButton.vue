<template>
  <div>
    <template>
      <schedule-card-info-button
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
import scheduleCardInfoDialog from '~/components/infoPost/ScheduleCardInfoDialog.vue'
export default {
  components: {
    scheduleCardInfoDialog,
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
