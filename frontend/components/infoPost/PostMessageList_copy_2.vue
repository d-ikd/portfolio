<template>
  <div style="background-color: white" class="mb-14">
    <v-row>
      <v-col v-for="message in messages" :key="message.id" class="flex-wrap">
        <v-card flat width="400">
          <post-message :message="message" />
        </v-card>
      </v-col>
    </v-row>
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
