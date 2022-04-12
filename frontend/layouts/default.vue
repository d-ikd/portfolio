<template>
  <v-app>
    <the-header />
    <v-main style="background-color: #393939">
      <nuxt />
      <div style="background-color: black" class="pb-15" />
      <the-footer />
    </v-main>
  </v-app>
</template>

<script>
import theHeader from '~/components/layouts/TheHeader.vue'
import theFooter from '~/components/layouts/TheFooter.vue'

export default {
  components: {
    theHeader,
    theFooter,
  },
}
</script>
