<template>
  <v-card flat style="background-color: white">
    <v-list>
      <v-card v-for="message in messages" :key="message.id" flat class="pb-2">
        <user-message :message="message" />
      </v-card>
    </v-list>
  </v-card>
</template>

<script>
import userMessage from '~/components/infoUser/UserMessage.vue'

export default {
  components: {
    userMessage,
  },
  props: {
    messages: {
      type: Array,
      required: true,
    },
  },
}
</script>

<style scoped></style>
