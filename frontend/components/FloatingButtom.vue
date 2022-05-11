<template>
  <!-- <template v-if="loginUser && loginUser.id == user.id"> -->
  <v-dialog
    v-model="dialog"
    hide-overlay
    transition="dialog-bottom-transition"
    max-width="600"
    persistent
  >
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        color="#BDBDBD88"
        dark
        x-large
        fixed
        fab
        bottom
        right
        v-bind="attrs"
        v-on="on"
        class="ma-10"
      >
        <v-icon color="white">mdi-pencil</v-icon>
      </v-btn>
    </template>

    <v-card>
      <v-toolbar dark color="primary">
        <v-btn icon dark @click="dialog = false">
          <v-icon>mdi-close</v-icon>
        </v-btn>
        <v-toolbar-title>投稿する</v-toolbar-title>
        <v-spacer></v-spacer>
        <!--
            <v-toolbar-items>
            <v-btn>
            </v-btn>
            </v-toolbar-items> -->
      </v-toolbar>

      <postCreate></postCreate>
    </v-card>
  </v-dialog>
</template>

<script>
import postCreate from '~/components/admin/PostCreate.vue'
export default {
  components: {
    postCreate,
  },
  methods: {
    closeDialogl() {
      this.dialog = false
    },
  },
  data() {
    return {
      /* === Setting of dIalog === */
      dialog: false,
      notifications: false,
      sound: true,
      widgets: false,
      /* === end of Setting of dIalog === */
    }
  },
}
</script>

<style></style>
