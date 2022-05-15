<template>
  <v-app dark>
    <v-row justify="center" class="mt-10">
      <h1 v-if="error.statusCode === 404">
        {{ pageNotFound }} (Go to <NuxtLink to="/"> Home page </NuxtLink> ?)
      </h1>
      <h1 v-else>
        {{ otherError }} (Go to <NuxtLink to="/"> Home page </NuxtLink> ?)
      </h1>
    </v-row>
  </v-app>
</template>

<script>
export default {
  layout: 'empty',
  props: {
    error: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      pageNotFound: '404 Not Found...',
      otherError: 'An error occurred',
    }
  },
  head() {
    const title =
      this.error.statusCode === 404 ? this.pageNotFound : this.otherError
    return {
      title,
    }
  },
}
</script>
