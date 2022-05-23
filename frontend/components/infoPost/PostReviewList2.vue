<template>
  <v-card flat style="background-color: white">
    <v-list style="background-color: white">
      <v-card
        v-for="review in reviews"
        :key="review.id"
        flat
        class="mb-2"
        style="background-color: white"
      >
        <post-review :review="review" />
      </v-card>
    </v-list>
  </v-card>
</template>

<script>
import postReview from '~/components/infoPost/PostReview.vue'

export default {
  components: {
    postReview,
  },
  props: {
    reviews: {
      type: Array,
      required: true,
    },
  },
}
</script>

<style scoped></style>
