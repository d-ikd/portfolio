<template>
  <v-row>
    <v-col v-for="n in 9" :key="n" class="d-flex child-flex" cols="4">
      <v-card width="400" dark flat>
        <v-hover>
          <template v-slot:default="{ hover }">
            <v-card dark flat>
              <v-btn absolute bottom color="pink" right fab>
                <v-icon>mdi-heart</v-icon>
              </v-btn>

              <v-img
                height="500px"
                :src="require(`@/assets/images/hina.jpg`)"
                gradient="to top, rgba(0,0,0,.10), rgba(0,0,0,.10)"
              >
                <v-app-bar flat color="rgba(0, 0, 0, 0)">
                  <v-toolbar-title class="title white--text pl-0">
                    雛祭り
                  </v-toolbar-title>

                  <v-spacer></v-spacer>

                  <v-avatar size="56" class="mt-1">
                    <img
                      alt="user"
                      :src="require(`@/assets/images/default-user.png`)"
                    />
                  </v-avatar>
                </v-app-bar>

                <!-- gradient="to top, rgba(0,0,0,.44), rgba(0,0,0,.44)" -->

                <!--             <v-card-title class="white--text mt-8">
              <p class="ml-3">
                John Doe
              </p>
            </v-card-title> -->

                <v-container class="fill-height">
                  <v-row align="center">
                    <strong class="display-4 font-weight-regular mr-6"
                      >8</strong
                    >
                    <v-row justify="end">
                      <div class="headline font-weight-light">
                        Monday
                      </div>
                      <div class="text-uppercase font-weight-light">
                        February 2015
                      </div>
                    </v-row>
                  </v-row>
                </v-container>
              </v-img>

              <v-fade-transition>
                <v-overlay v-if="hover" absolute color="#036358">
                  <v-btn to="/page" nuxt>See more info</v-btn>
                </v-overlay>
              </v-fade-transition>
            </v-card>
          </template>
        </v-hover>

        <v-card-text>
          <div class="font-weight-bold ml-8 mb-2">
            Today
          </div>

          <v-timeline align-top dense>
            <v-timeline-item
              v-for="message in messages"
              :key="message.time"
              :color="message.color"
              small
            >
              <div>
                <div class="font-weight-normal">
                  <strong>{{ message.from }}</strong> @{{ message.time }}
                </div>
                <div>{{ message.message }}</div>
              </div>
            </v-timeline-item>
          </v-timeline>
        </v-card-text>
          <!-- =====test============== -->
          <v-avatar size="56" class="mt-1">
            <img
              alt="user"
              :src="require(`@/assets/images/default-user.png`)"
            >
          </v-avatar>
          <!-- =====test============== -->
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      messages: [
        {
          from: '代々木公園',
          message: `ピクニック`,
          time: '13:00',
          color: 'deep-purple lighten-1',
        },
        {
          from: '移動',
          message: '山手線外回り',
          time: '10:00am',
          color: 'green',
        },
        {
          from: 'A地点',
          message: '集合',
          time: '9:00am',
          color: 'deep-purple lighten-1',
        },
      ],
    }
  },
}
</script>
