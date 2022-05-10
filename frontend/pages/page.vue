<template>
  <div>
    <v-parallax
      height="500"
      src="https://cdn.vuetifyjs.com/images/parallax/material2.jpg"
    ></v-parallax>

    <v-sheet class="mx-auto" elevation="1" max-width="1500">
      <v-slide-group
        v-model="model"
        class="pa-4"
        active-class="success"
        show-arrows
      >
        <v-slide-item v-for="n in 15" :key="n" v-slot="{ active, toggle }">
          <v-card
            :color="active ? undefined : 'grey lighten-1'"
            class="ma-4"
            height="200"
            width="100"
            @click="toggle"
          >
            <v-row class="fill-height" align="center" justify="center">
              <v-scale-transition>
                <v-icon
                  v-if="active"
                  color="white"
                  size="48"
                  v-text="'mdi-close-circle-outline'"
                ></v-icon>
              </v-scale-transition>
            </v-row>
          </v-card>
        </v-slide-item>
      </v-slide-group>
    </v-sheet>

    <v-row no-gutters>
      <v-col v-for="n in 30" :key="n" class="d-flex child-flex" cols="4">
        <v-slide-group multiple show-arrows>
          <v-img
            :src="`https://picsum.photos/500/300?image=${n * 5 + 10}`"
            :lazy-src="`https://picsum.photos/10/6?image=${n * 5 + 10}`"
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
        </v-slide-group>
      </v-col>
    </v-row>
  </div>
</template>
