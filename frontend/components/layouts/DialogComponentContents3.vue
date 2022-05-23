<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialogComponent"
      hide-overlay
      transition="dialog-bottom-transition"
      max-width="600"
      persistent
    >
      <v-row no-gutters>
        <v-col> </v-col>
        <v-col cols="sm" class="text-center align-self-center">
          <v-sheet elevation="4" class="rounded-pill">
            <template>
              <v-chip label color="white" large outlined text-color="purple">
                <v-icon>mdi-wrench</v-icon> 設定
              </v-chip>
            </template>
          </v-sheet>
        </v-col>
        <v-col>
          <button-close @close-dialog="closeDialog" />
        </v-col>
      </v-row>

      <v-sheet
        width="500px"
        color="transparent"
        class=" mx-auto pb-3 mb-10 rounded-card"
      >
        <the-account-setting />
      </v-sheet>

      <v-sheet class="d-flex justify-center transparent">
        <v-btn
          transparent
          color="white"
          class="pink--text font-weight-bold mt-n10 mb-2"
          min-width="125px"
          @click="closeDialog"
        >
          <v-icon>mdi-window-close</v-icon>
          閉じる
        </v-btn>
      </v-sheet>
    </v-dialog>
  </v-row>
</template>

<script>
import postCreateComponent from './PostCreateComponent.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import theAccount from '~/components/layouts/TheAccount.vue'
import theAccountSetting from '~/components/layouts/TheAccountSetting.vue'

export default {
  components: {
    buttonClose,
    scheduleCardInfo,
    postCreateComponent,
    theAccount,
    theAccountSetting,
  },
  props: {
    dialogComponent: false,

    posting: {
      type: Object,
      default: () => {},
      required: false,
    },
  },
  methods: {
    closeDialog() {
      this.$emit('result', { res: true, message: '' })
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 100px;
}
</style>
