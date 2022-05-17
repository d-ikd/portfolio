<template>
  <div style="background-color: white">
    <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
        <v-row no-gutters>
          <v-col
            v-for="image in images"
            :key="image.id"
            class="d-flex child-flex"
            cols="4"
          >
            <v-hover>
              <template v-slot:default="{ hover }">
                <v-card :elevation="3" class="secondary ma-1 rounded-card">
                  <v-img
                    :src="`https://picsum.photos/500/300?image=${n * 9 + 10}`"
                    :lazy-src="`https://picsum.photos/10/6?image=${n * 9 + 10}`"
                    aspect-ratio="1"
                  >
                    <template v-slot:placeholder>
                      <v-row
                        class="fill-height ma-0"
                        align="center"
                        justify="center"
                      >
                        <v-progress-circular
                          indeterminate
                          color="grey lighten-5"
                        ></v-progress-circular>
                      </v-row>
                    </template>
                    <v-fade-transition>
                      <v-overlay v-if="hover" absolute color="#036358">
                        <v-icon large @click="next">
                          mdi-facebook
                        </v-icon>
                        <v-icon large @click="next">
                          mdi-twitter
                        </v-icon>
                        <v-icon large @click="next">
                          mdi-instagram
                        </v-icon>
                      </v-overlay>
                    </v-fade-transition>
                  </v-img>
                </v-card>
              </template>
            </v-hover>
          </v-col>
        </v-row>
      </v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
// import postReview from '~/components/infoPost/PostReview.vue'

export default {
  components: {
    // postReview,
  },
  props: {
    images: {
      type: Array,
      required: true,
    },
  },
  methods: {
    next() {
      alert('You clicked next!')
    },
  },
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
