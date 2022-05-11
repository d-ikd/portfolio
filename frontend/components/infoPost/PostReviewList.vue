<template>
  <v-card flat class="ma-2">
    <v-list style="background-color: white">
      <v-card v-for="review in reviews" :key="review.id" flat class="mb-2">
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
