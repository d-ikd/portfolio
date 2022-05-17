<template>
  <v-parallax dark :src="post.image.url">
    <v-row>
      <v-col class="text-center" cols="12">
        <div align="right">
          <v-chip
            class="ma-5 font-weight-bold"
            color="blue-grey darken-2"
            label
            text-color="white"
          >
            {{ post.category }}
          </v-chip>
        </div>
      </v-col>
    </v-row>
    <v-row>
      <v-col class="" cols="12">
        <div align="top" class="display-1 ma-16 font-weight-bold">
          {{ post.name }}
        </div>
      </v-col>
    </v-row>
  </v-parallax>

    <!-- <v-img v-if="post.image.url" :src="post.image.url" contain />
    <v-img v-else :src="defaultImage" contain /> -->

</template>

<script>
export default {
  components: {},
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  methods: {},
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.radius-image-2 {
  border: 5px solid;
  border-radius: 20px;
}
</style>
