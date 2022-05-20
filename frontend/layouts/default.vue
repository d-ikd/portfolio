<template>
  <v-app>
    <the-header />
    <v-main>
      <snackbar-message />
      <nuxt />
      <button-post-create />
      <the-footer />
    </v-main>
  </v-app>
</template>

<script>
import theHeader from '~/components/layouts/TheHeader.vue'
import theFooter from '~/components/layouts/TheFooter.vue'
import snackbarMessage from '~/components/layouts/SnackbarMessage.vue'
import buttonPostCreate from '~/components/layouts/ButtonPostCreate.vue'

export default {
  components: {
    theHeader,
    theFooter,
    snackbarMessage,
    buttonPostCreate,
  },
}
</script>
