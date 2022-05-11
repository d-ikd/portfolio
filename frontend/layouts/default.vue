<template>
  <v-app>
    <the-header />
    <!-- <the-sidebar /> -->
    <v-main style="background-color: black">
      <!-- <the-side-button /> -->
      <!-- <food-message /> -->
      <flash-message />
      <nuxt />
      <div style="background-color: black" class="pb-15" />
      <floating-buttom />
      <the-footer />
    </v-main>
  </v-app>
</template>

<script>
/* import theSidebar from "~/components/layouts/TheSidebar.vue" */
import theHeader from '~/components/layouts/TheHeader.vue'
/* import theSideButton from "~/components/layouts/TheSideButton.vue" */
import theFooter from '~/components/layouts/TheFooter.vue'
import flashMessage from '~/components/layouts/FlashMessage.vue'
/* import foodMessage from "~/components/layouts/FoodMessage.vue" */
import FloatingButtom from '~/components/FloatingButtom.vue'

export default {
  components: {
    /* theSidebar, */
    theHeader,
    /* theSideButton, */
    theFooter,
    flashMessage,
    /* foodMessage, */
    FloatingButtom,
  },
}
</script>

<style>
/* v-main {
  background-color: #fbfbfb;
} */
.btn {
  position: fixed;
  z-index: 50;
}
</style>
