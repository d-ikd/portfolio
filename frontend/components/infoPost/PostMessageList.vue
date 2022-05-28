<template>
  <div>
    <v-list style="background-color: white">
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
      required: true,
    },
  },
}
</script>
