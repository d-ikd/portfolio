<template>
  <v-container>
    <p class="black--text">test</p>

    <div class="black--text my-5 show-rate">
      <span class="font-weight-bold"> また参加したい </span>
      <v-rating
        v-model="post.avg_rate"
        empty-icon="mdi-heart-outline"
        full-icon="mdi-heart"
        background-color="orange lighten-1"
        color="orange darken-2"
        readonly
        class="ml-5"
        dense
        large
      />
      <span class="ma-1 font-weight-bold">
        {{ post.name }}
      </span>
    </div>
  </v-container>
</template>

<script>
// import { mapGetters, mapActions } from 'vuex'

export default {
  props: {
    post: {
      type: object,
      required: true,
    },
  },
}
</script>

<style scoped>
.show-rate {
  font-size: 20px;
  font-weight: 200;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>
