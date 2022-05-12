<template>
  <div>
    <!-- <user-post-list :posts="posts" /> -->

    <v-row>
      <v-col
        v-for="post in posts"
        :key="post.id"
        class="d-flex child-flex"
        cols="4"
      >
        <v-card width="400" dark flat>
          <v-hover>
            <template v-slot:default="{ hover }">
              <v-card dark flat>
                <v-btn absolute bottom color="pink" right fab>
                  <v-icon>mdi-heart</v-icon>
                </v-btn>
                <!-- ====気になるボタン==== -->
                <div align="center" justify="end">
                  <v-btn
                    v-if="like"
                    class="mx-5"
                    color="red white--text font-weight-bold"
                    @click="nice"
                  >
                    <v-icon>mdi-heart-off</v-icon>
                  </v-btn>
                  <v-btn
                    v-else
                    class="mx-5"
                    color="green white--text font-weight-bold"
                    @click="nice"
                  >
                    <v-icon>mdi-heart</v-icon>
                  </v-btn>
                </div>
                <!-- ====気になるボタン==== -->

                <v-img
                  height="500px"
                  gradient="to top, rgba(0,0,0,.10), rgba(0,0,0,.10)"
                  v-if="post.image.url"
                  contain
                  :src="post.image.url"
                />
                <v-img v-else contain :src="defaultImage" />

                <v-app-bar flat color="rgba(0, 0, 0, 0)">
                  <v-toolbar-title class="title white--text pl-0">
                    {{ post.name }}
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
                    <strong class="display-4 font-weight-regular mr-6">{{
                      post.id
                    }}</strong>
                    <v-row justify="end">
                      <div class="headline font-weight-light">
                        Monday
                      </div>
                      <div>
                        {{ post.release }}
                      </div>
                    </v-row>
                  </v-row>
                </v-container>

                <v-fade-transition>
                  <v-overlay v-if="hover" absolute color="#036358">
                    <v-btn
                      :to="{ path: `/post/${post.id}` }"
                      @click="pagelink(post.id)"
                      >See more info</v-btn
                    >
                  </v-overlay>
                </v-fade-transition>
              </v-card>
            </template>
          </v-hover>

          <v-card-text>
            <div class="font-weight-bold ml-8 mb-2">
              Today
            </div>
            <!--
            <v-timeline
              align-top
              dense
            >
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
            </v-timeline> -->
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import userPostList from '~/components/infoUser/UserPostList.vue'
import { mapGetters, mapActions } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
    // userUpdate() {
    //   return this.$store.state.auth.loginUser
    // },
  },
  components: {
    userPostList,
  },
  data() {
    return {
      defaultImage: require(`@/assets/images/default.png`),
      messages1: [
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
      posts: [],
    }
  },
  created() {
    this.getPosts().then(() => {
      this.loading = true
    })
    this.$axios.get('api/v1/posts').then((res) => {
      this.posts = res.data
    })
  },
  methods: {
    ...mapActions({ getPosts: 'post/getPosts' }),
  },
  method: {
    pagelink(link) {
      this.$router.push({ path: `/post/${link}` })
    },
  },
}
</script>
