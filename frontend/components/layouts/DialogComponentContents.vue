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
            <template v-if="isPostCreate">
              <v-chip
                label
                color="transparent"
                x-large
                outlined
                text-color="green"
              >
                <v-icon class="ml-2 mr-2">mdi-pencil</v-icon>
                記事を投稿する
              </v-chip>
            </template>
            <template v-else-if="isAccountSetting">
              <v-chip
                label
                color="transparent"
                x-large
                outlined
                text-color="red"
              >
                <v-icon class="ml-2 mr-2">mdi-account-circle</v-icon>
                アカウント
              </v-chip>
            </template>
            <template v-else-if="isScheduleCardInfo">
              <v-chip label color="white" large outlined text-color="red">
                <v-icon>mdi-run</v-icon>
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
        <template v-if="isPostCreate">
          <post-create-component />
        </template>
        <template v-else-if="isAccountSetting">
          <the-account />
        </template>
        <template v-else-if="isScheduleCardInfo">
          <schedule-card-info :post="posting" />
        </template>
        <template v-else>
          elseelseelse
        </template>
      </v-sheet>

      <v-spacer class="mx-auto" />

      <v-sheet class="d-flex justify-center transparent mb-10 ">
        <v-row>
          <v-col cols="4"> </v-col>
          <v-col>
            <v-btn
              transparent
              color="white"
              class="pink--text font-weight-bold"
              min-width="125px"
              @click="closeDialog"
            >
              <v-icon>mdi-window-close</v-icon>
              閉じる
            </v-btn>
          </v-col>
          <v-col cols="2">
            <v-sheet style="position: relative;">
              <button-like
                :user="loginUser"
                :post="post"
                :is-rounded-like="true"
              />
            </v-sheet>
          </v-col>
          <v-col cols="2">
            <v-sheet style="position: relative;">
              <button-like
                :user="loginUser"
                :post="post"
                :is-rounded-join="true"
              />
            </v-sheet>
          </v-col>
        </v-row>
      </v-sheet>
    </v-dialog>
  </v-row>
</template>

<script>
import postCreateComponent from './PostCreateComponent.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import theAccount from '~/components/layouts/TheAccount.vue'

export default {
  components: {
    buttonClose,
    scheduleCardInfo,
    postCreateComponent,
    theAccount,
  },
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
