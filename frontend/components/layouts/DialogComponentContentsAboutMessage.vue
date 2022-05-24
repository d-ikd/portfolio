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
            <template v-if="isMessageCreate">
              <v-chip
                label
                color="transparent"
                x-large
                outlined
                text-color="green"
              >
                <v-icon class="ml-2 mr-2">mdi-pencil</v-icon>
                メッセージ
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
        <template v-if="isMessageCreate">
          <message-create-component :post="posting" />
        </template>
        <template v-if="isMessageEdit">
          <message-edit-component :post="posting" />
        </template>
        <template v-if="isMessageDelete">
          <message-delete-component :post="posting" />
        </template>
        <template v-else>
          aaa
        </template>
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
import messageCreateComponent from '~/components/layouts/MessageCreateComponent.vue'
import messageEditComponent from '~/components/layouts/MessageEditComponent.vue'
import buttonClose from '~/components/layouts/ButtonClose.vue'
/* import listComponent from '~/components/layouts/ListComponent.vue' */

export default {
  components: {
    buttonClose,
    messageCreateComponent,
    messageEditComponent,
    /* listComponent, */
  },
  props: {
    dialogComponent: {
      type: Boolean,
      default: false,
    },

    posting: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isMessageCreate: {
      type: Boolean,
      default: false,
    },
    isMessageEdit: {
      type: Boolean,
      default: false,
    },
    isMessageDelete: {
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
  border-radius: 20px;
}
</style>
