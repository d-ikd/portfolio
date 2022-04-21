<template>
  <v-app>
    <the-header />
    <v-main>
      <nuxt />
    </v-main>
    <the-footer />
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
  // data() {},
}
</script>
