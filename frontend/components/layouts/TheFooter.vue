<template>
  <v-footer
    class="elevation-10 footertitle flex justify-center mt-5"
    color="#7a99cf"
    absolute
  >
    <div>
      &copy; {{ new Date().getFullYear() }}<span class="ml-2">Stuctive</span>
    </div>
  </v-footer>
</template>

<style scoped>
.footertitle {
  color: white;
  font-size: 16px;
  font-family: 'Fraunces', sans-serif;
  /* https://developer.mozilla.org/en-US/docs/Web/CSS/font-family */
}
</style>
