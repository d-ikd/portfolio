<template>
  <div>
    <template v-if="isPostCreate">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        @result="response"
        :is-post-create="isPostCreate"
      />
      <v-btn
        color="#BADEC3"
        dark
        x-large
        fixed
        fab
        bottom
        right
        class="ma-10"
        @click.stop="dialogComponent = true"
      >
        <v-icon color="white">mdi-pencil</v-icon>
      </v-btn>
    </template>
    <template v-else-if="isAccountSetting">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        @result="response"
        :is-account-setting="isAccountSetting"
      />
      <v-btn color="white" plain @click.stop="dialogComponent = true"
        ><v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </template>
    <template v-else-if="isScheduleCardInfo">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        @result="response"
        :is-schedule-card-info="isScheduleCardInfo"
        :posting="post"
      />
      <v-btn
        color="orange"
        dark
        small
        absolute
        fab
        left
        top
        class="mt-n13"
        @click.stop="dialogComponent = true"
      >
        <v-icon dark>
          mdi-walk
        </v-icon>
      </v-btn>
    </template>

    <template v-else>
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :dialog-items="dialogItems"
        @result="response"
        :is-post-create="isPostCreate"
      />
      <v-btn color="primary" dark @click.stop="dialogComponent = true">
        Open Dialog
      </v-btn>
    </template>
    <p class="mt-1 text-danger">{{ message }}</p>
  </div>
</template>

<script>
import dialogComponentContents from '~/components/layouts/DialogComponentContents.vue'
export default {
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

    isAccountSetting: {
      type: Boolean,
      default: false,
    },
    isScheduleCardInfo: {
      type: Boolean,
      default: false,
    },
  },

  data() {
    return {
      dialogComponent: false,
      dialogItems: {
        title: 'ダイアログタイトル',
        text: 'テキストテキストテキストテキストテキストテキスト',
      },
      message: '',
    }
  },
  components: {
    dialogComponentContents,
  },
  methods: {
    closeDialog() {
      this.dialog = false
    },
    response(obj) {
      this.message = obj.message
      this.dialogComponent = false
    },
  },
}
</script>
