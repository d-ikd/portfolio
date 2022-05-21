<template>
  <v-btn
    rounded
    color="#48A1EB"
    class="font-weight-bold white--text"
    min-width="200px"
    @click="buttonAction"
  >
    変更
  </v-btn>
</template>

<script>
export default {
  methods: {
    buttonAction() {
      this.$emit('button-action')
    },
  },
}
</script>
