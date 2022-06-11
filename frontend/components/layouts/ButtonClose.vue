<template>
  <v-card-title class="transparent white--text">
    <span class="headline"></span>

    <v-spacer></v-spacer>

    <v-menu bottom left>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="#BDBDBD88"
          fab
          dark
          x-large
          v-bind="attrs"
          v-on="on"
          @click="closeDialog"
        >
          <v-icon color="white"> mdi-close-circle-outline</v-icon>
        </v-btn>
      </template>
    </v-menu>
  </v-card-title>
</template>

<script>
export default {
  methods: {
    closeDialog() {
      this.$emit('close-dialog')
    },
  },
}
</script>
