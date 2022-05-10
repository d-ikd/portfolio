<template>
  <v-app>
    <theHeader />
    <v-main
      ><!--v-main style="background-color: #fbfbfb" -->
      <flash-message />
      <nuxt />
      <!-- <div style="background-color: blue" class="pb-15" /> -->
    </v-main>
    <theFooter />
  </v-app>
</template>

<script>
import TheHeader from '~/components/layouts/TheHeader.vue'
import TheFooter from '~/components/layouts/TheFooter.vue'
import FlashMessage from '~/components/layouts/FlashMessage.vue'
export default {
  components: {
    TheHeader,
    TheFooter,
    FlashMessage,
  },
}
</script>
