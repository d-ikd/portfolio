<template>
  <div style="background-color: white">
    <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
        <v-row no-gutters>
          <v-col v-for="n in 9" :key="n" class="d-flex child-flex" cols="4">
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

      <v-carousel-item>
        <v-row no-gutters>
          <v-col v-for="n in 9" :key="n" class="d-flex child-flex" cols="4">
            <v-hover>
              <template v-slot:default="{ hover }">
                <v-card :elevation="3" class="secondary ma-1 rounded-card">
                  <v-img
                    :src="`https://picsum.photos/500/300?image=${n * 4 + 10}`"
                    :lazy-src="`https://picsum.photos/10/6?image=${n * 4 + 10}`"
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

      <v-carousel-item>
        <v-row no-gutters>
          <v-col v-for="n in 9" :key="n" class="d-flex child-flex" cols="4">
            <v-img
              :src="`https://picsum.photos/500/300?image=${n * 6 + 10}`"
              :lazy-src="`https://picsum.photos/10/6?image=${n * 6 + 10}`"
              aspect-ratio="1"
              class="grey lighten-2"
            >
              <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                  <v-progress-circular
                    indeterminate
                    color="grey lighten-5"
                  ></v-progress-circular>
                </v-row>
              </template>
            </v-img>
          </v-col>
        </v-row>
      </v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
export default {
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
