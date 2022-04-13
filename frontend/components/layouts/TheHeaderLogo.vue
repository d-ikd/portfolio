<template>
  <nuxt-link to="/" class="link">
    <v-toolbar-title class="header-title">{{ title }}</v-toolbar-title>
  </nuxt-link>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      title: 'Hi',
    }
  },
}
</script>
