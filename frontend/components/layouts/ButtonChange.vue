<template>
  <v-btn
    v-if="originEmail != guest"
    rounded
    color="#48A1EB"
    class="font-weight-bold white--text"
    min-width="200px"
    @click="buttonAction"
  >
    変更
  </v-btn>
  <v-btn v-else block color="grey" class="white--text">
    ゲストユーザーの為変更できません
  </v-btn>
</template>

<script>
export default {
  data() {
    return {
      email: this.$store.getters['auth/currentUser'].email,
      originEmail: this.$store.getters['auth/currentUser'].uid,
      guest: 'guestuser20220106@gmail.com',
    }
  },
  methods: {
    buttonAction() {
      this.$emit('button-action')
    },
  },
}
</script>
