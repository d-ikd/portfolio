<template>
  <div>
    <v-row class="mb-n4">
      <v-col> </v-col>
      <v-col cols="sm" class="text-center align-self-center">
        <v-sheet elevation="4" class="rounded-pill mt-3 mb-n2">
          <v-chip
            label
            color="transparent"
            x-large
            text-color="green lighten-2"
          >
            <v-icon class="ml-2 mr-2">mdi-email-variant</v-icon>
            メッセージ
          </v-chip>
        </v-sheet>
      </v-col>
      <v-col> </v-col>
    </v-row>
    <v-list>
      <v-card v-for="message in messages" :key="message.id" flat class="mb-2">
        <post-message :message="message" />
      </v-card>
    </v-list>
  </div>
</template>

<script>
import postMessage from '~/components/infoPost/PostMessage.vue'

export default {
  components: {
    postMessage,
  },
  props: {
    messages: {
      type: Array,
      default: () => ({}),
      required: true,
    },
  },
}
</script>
