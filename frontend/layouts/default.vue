<template>
  <v-app>
    <template v-if="$auth.loggedIn">
      <login-header
        @toggle-drawer="$refs.drawer.drawer = !$refs.drawer.drawer"
      />
    </template>
    <template v-else>
      <the-header @toggle-drawer="$refs.drawer.drawer = !$refs.drawer.drawer" />
    </template>
    <v-main>
      <nuxt />
    </v-main>
    <the-footer />
  </v-app>
</template>

<script>
import theHeader from '~/components/layouts/TheHeader.vue'
import theFooter from '~/components/layouts/TheFooter.vue'
import loginHeader from '~/components/layouts/LoginHeader.vue'
export default {
  components: {
    theHeader,
    theFooter,
    loginHeader,
  },
  // data() {},
}
</script>
