<template>
  <v-sheet class="green lighten-2 mb-4">
    <v-timeline align-top dense>
      <v-timeline-item color="white lighten-3" fill-dot small>
        <v-row class="pt-1">
          <v-col>
            <strong>集合: {{ post.start_time }}</strong>
          </v-col>
          <v-col>
            <strong
              >場所: {{ post.place }} / 募集メンバー:
              {{ post.member }}人</strong
            >
            <div class="caption mb-2">予算: {{ post.price }}円/人</div>
            <user-dialog-shown :users="post.join_users" :title="'参加者'" />
          </v-col>
        </v-row>
      </v-timeline-item>
      <v-timeline-item fill-dot small>
        <v-row class="pt-1">
          <v-col>
            <strong>終了: {{ post.finish_time }}</strong>
          </v-col>
        </v-row>
      </v-timeline-item>
    </v-timeline>
  </v-sheet>
</template>

<script>
import userDialogShown from '~/components/infoUser/UserDialogShown.vue'

export default {
  components: {
    userDialogShown,
  },
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  methods: {},
}
</script>
