<template>
  <div>
    <v-btn x-large color="error" dark @click="count(3)">
      {{ counter }}
    </v-btn>

    <p><button @click="testflash">testflash</button></p>
    <button
      @click="
        flashMessage({
          message: 'aaa',
          type: success,
          status: true,
        }),
          { root: true }
      "
    >
      flash
    </button>

    <v-snackbar
      v-model="status"
      transition="slide-x-reverse-transition"
      right
      top
      :color="type"
    >
      <div class="ml-5 font-weight-bold white--text">
        {{ message }}
      </div>
    </v-snackbar>

    <section class="container">isCalled: {{ isCalled }}</section>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      message: 'flashMessage/message',
      type: 'flashMessage/type',
      status: 'flashMessage/status',
    }),
    ...mapGetters(['isCalled']),
    ...mapGetters({ counter: 'rinrei/counter' }),
    /* ...mapGetters("rinrei", ["counter"]), */
  },
  methods: {
    testflash() {
      return this.$store.dispatch(
        'flashMessage/showMessage',
        {
          message: 'Hello!',
          type: 'sucess',
          status: true,
        },
        { root: true }
      )
    },
    // ...mapActions({ flashMessage: 'flashMessage/showMessage' }),
    // ...mapActions({ count: 'rinrei/countAction' }),
  },
}
</script>

<style scoped>
.message {
  color: transparent;
}
</style>
