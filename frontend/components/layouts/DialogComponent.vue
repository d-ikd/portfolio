<template>
  <div>
    <template v-if="isPostCreate">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :is-post-create="true"
        @result="response"
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
    <template v-else-if="isAccountPage">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :is-account-page="true"
        @result="response"
      />
      <v-btn color="white" plain @click.stop="dialogComponent = true"
        ><v-icon>mdi-dots-vertical</v-icon>
      </v-btn>
    </template>
    <template v-else-if="isAccountSetting">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :is-account-setting="true"
        @result="response"
      />
      <v-btn color="orange white--text" @click.stop="dialogComponent = true">
        メッセージ
        <v-icon dark>
          mdi-walk
        </v-icon>
      </v-btn>
    </template>
    <template v-else-if="isScheduleCardInfo">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :is-schedule-card-info="true"
        :posting="post"
        @result="response"
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
    <template v-else-if="isScheduleCardInfoInList">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :is-schedule-card-info="true"
        :posting="post"
        @result="response"
      />
      <v-btn color="orange white--text" @click.stop="dialogComponent = true">
        参加ページへ
        <v-icon dark>
          mdi-walk
        </v-icon>
      </v-btn>
    </template>
    <template v-else-if="isMessageList">
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :is-message-list="true"
        :posting="post"
        @result="response"
      />
      <v-btn color="purple white--text" @click.stop="dialogComponent = true">
        設定へ
        <v-icon dark>
          mdi-walk
        </v-icon>
      </v-btn>
    </template>

    <template v-else>
      <dialogComponentContents
        :dialog-component="dialogComponent"
        :dialog-items="dialogItems"
        :is-post-create="isPostCreate"
        @result="response"
      />
      <v-btn color="primary" dark @click.stop="dialogComponent = true">
        Open Dialog
      </v-btn>
    </template>
    <!-- <p class="mt-1 text-danger">{{ message }}</p> -->
  </div>
</template>

<script>
import dialogComponentContents from '~/components/layouts/DialogComponentContents.vue'
export default {
  components: {
    dialogComponentContents,
  },
  props: {
    post: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isPostCreate: {
      type: Boolean,
      default: false,
    },
    isAccountPage: {
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
    isScheduleCardInfoInList: {
      type: Boolean,
      default: false,
    },
    isMessageList: {
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
