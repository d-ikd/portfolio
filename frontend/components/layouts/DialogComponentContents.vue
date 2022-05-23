<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialogComponent"
      hide-overlay
      transition="dialog-bottom-transition"
      max-width="600"
      persistent
    >
      <button-close @close-dialog="closeDialog" />
      <v-card width="400px" class="mx-auto pb-3 mb-10">
        <v-card-title class="headline">
          投稿詳細
        </v-card-title>
        <template v-if="isPostCreate">
          <post-create-component />
        </template>
        <template v-else-if="isAccountSetting">
          <the-header-account-setting />
        </template>
        <template v-else-if="isScheduleCardInfo">
          <schedule-card-info :post="posting" />
        </template>
        <template v-else>
          elseelseelse
        </template>
      </v-card>

      <v-spacer class="mx-auto" />

      <v-sheet class="d-flex justify-center transparent mb-10">
        <v-btn
          x-large
          transparent
          outlined
          color="#48A1EB"
          class="font-weight-bold"
          min-width="125px"
          @click="closeDialog"
        >
          <v-icon>mdi-cube-send</v-icon>
          閉じる
        </v-btn>
      </v-sheet>
    </v-dialog>
  </v-row>
</template>

<script>
import buttonClose from '~/components/layouts/ButtonClose.vue'
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import postCreateComponent from './PostCreateComponent.vue'
import theHeaderAccountSetting from '~/components/layouts/TheHeaderAccountSetting.vue'

export default {
  props: {
    dialogComponent: false,

    posting: {
      type: Object,
      default: () => {},
      required: false,
    },

    isPostCreate: {
      type: Boolean,
      default: false,
    },
    isAccountSetting: {
      type: Boolean,
      default: false,
    },
    isScheduleCardInfo: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    closeDialog() {
      this.$emit('result', { res: true, message: '同意されました。' })
    },
  },
  components: {
    buttonClose,
    scheduleCardInfo,
    postCreateComponent,
    theHeaderAccountSetting,
  },
}
</script>
