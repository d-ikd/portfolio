<template>
  <v-row class="d-flex justify-end">
    <v-col>
      <v-dialog
        v-model="dialog"
        transition="slide-y-reverse-transition"
        persistent
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="orange"
            dark
            x-large
            v-bind="attrs"
            absolute
            fab
            left
            top
            class="mt-n13"
            v-on="on"
          >
            <v-icon dark right x-large>
              mdi-run
            </v-icon>
          </v-btn>
        </template>

        <v-card
          color="white"
          max-width="600"
          min-width="200"
          style="max-height: 600px"
          class="overflow-y-auto"
        >
          <v-card-title class="transparent white--text">
            <span class="headline"></span>

            <v-spacer></v-spacer>

            <v-menu bottom left>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="#BDBDBD88"
                  fab
                  dark
                  x-large
                  v-bind="attrs"
                  v-on="on"
                  @click="dialog = false"
                >
                  <v-icon color="white"> mdi-close-circle-outline</v-icon>
                </v-btn>
              </template>
            </v-menu>
          </v-card-title>

          <!--                                    <v-toolbar>
            <v-toolbar-title>Settings</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items>
              <v-btn
                dark
                text
                @click="dialog = false"
              >
                Save
              </v-btn>
            </v-toolbar-items>
          </v-toolbar> -->

          <v-card-text class="pt-6" style="position: relative;">
            <div>
              <span class="font-weight-light grey--text title mb-2">
                {{ $dayjs(post.release).format('MM/DD') }}
                (
                {{ $dayjs(post.start_time).format('hh:mm') }}~{{
                  $dayjs(post.finish_time).format('hh:mm')
                }}
                ) <br />@{{ post.place }}
              </span>
            </div>
          </v-card-text>

          <v-sheet class="white black--text">
            <post-container-like :post="post" />
            <!-- <post-container-message :post="post"/> -->

            <v-timeline align-top dense>
              <v-timeline-item color="white lighten-3" fill-dot small>
                <v-row class="pt-1">
                  <v-col cols="3">
                    <strong
                      >集合:
                      {{ $dayjs(post.start_time).format('hh:mm') }}</strong
                    >
                  </v-col>
                  <v-col>
                    <div class="caption mb-2">
                      <strong
                        >場所: {{ post.place }} / 募集メンバー:
                        {{ post.member }}人</strong
                      >

                      予算: {{ post.price }}円/人
                    </div>
                    <v-avatar>
                      <v-img
                        src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairFrida&accessoriesType=Kurt&hairColor=Red&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=Wink&eyebrowType=RaisedExcitedNatural&mouthType=Disbelief&skinColor=Brown"
                      ></v-img>
                    </v-avatar>
                  </v-col>
                </v-row>
              </v-timeline-item>
              <v-timeline-item fill-dot small>
                <v-row class="pt-1">
                  <v-col cols="3">
                    <strong
                      >終了:
                      {{ $dayjs(post.finish_time).format('hh:mm') }}</strong
                    >
                  </v-col>
                </v-row>
              </v-timeline-item>
            </v-timeline>
          </v-sheet>

          <v-btn color="green darken-1" text @click="dialog = false">
            Agree
          </v-btn>
        </v-card>
      </v-dialog>
    </v-col>
  </v-row>
</template>

<script>
import postContainerLike from '~/components/infoPost/PostContainerLike.vue'
import postContainerMessage from '~/components/infoPost/PostContainerMessage.vue'

export default {
  components: {
    postContainerLike,
    postContainerMessage,
  },
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      dialog: false,
      items: [
        { title: 'Click Me' },
        { title: 'Click Me' },
        { title: 'Click Me' },
        { title: 'Click Me 2' },
      ],
    }
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
</style>
