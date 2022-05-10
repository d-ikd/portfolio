<template>
  <div>
    <p>index</p>
    <button @click="count(7)">{{ counter }}</button>
    <p>いいね ({{ rinrin / 2 }})</p>
  </div>
</template>

<script>
// import { mapActions, mapGetters } from "vuex"
import { mapGetters, mapActions } from 'vuex'
export default {
  props: ['rinrin'],
  components: {},
  computed: {
    ...mapGetters({ counter: 'count/counter' }),
    /* ...mapGetters("rinrei", ["counter"]), */
  },
  methods: {
    ...mapActions({ count: 'count/countAction' }),
    //   count () {
    //     return this.$store.dispatch('rinrei/countAction', 3)
    // },
  },
}
</script>
