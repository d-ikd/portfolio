<template>
  <v-app>
    <!-- <the-header /> -->
    <v-main>
      <snackbar-message />
      <nuxt />
      <dialog-component :is-post-create="true" />
      <the-footer />
    </v-main>
  </v-app>
</template>

<script>
/* import theHeader from '~/components/layouts/TheHeader.vue' */
import theFooter from '~/components/layouts/TheFooter.vue'
import snackbarMessage from '~/components/layouts/SnackbarMessage.vue'
import dialogComponent from '~/components/layouts/DialogComponent.vue'

export default {
  components: {
    /* theHeader, */
    theFooter,
    snackbarMessage,
    dialogComponent,
  },
}
</script>
