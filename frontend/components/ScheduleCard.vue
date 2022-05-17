<template>
  <!-- <user-post-list :posts="posts" /> -->

  <div style="background-color: white">
    <v-row>
      <v-col cols="12" sm="6"> </v-col>

      <v-col cols="12" sm="6"> </v-col>
    </v-row>

    <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
        <v-row>
          <v-col
            v-for="post in posts"
            :key="post.id"
            class="d-flex child-flex flex-wrap"
            cols="4"
          >
            <v-card :elevation="10" class="secondary ma-3 rounded-card">
              <v-responsive :aspect-ratio="9 / 16">
                <v-hover>
                  <template v-slot:default="{ hover }">
                    <v-sheet dark flat>
                      <v-img
                        v-if="post.image.url"
                        contain
                        :src="post.image.url"
                        :aspect-ratio="1 / 1"
                        class="white--text align-end"
                        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                      >
                        <!--!!!!!!!!!!!! :aspect-ratio="16/9" !!!!!!!!!!!!-->
                        <!-- <v-img v-else contain :src="defaultImage"> -->

                        <v-card-title>
                          <strong class="display-2 font-weight-regular">{{
                            post.name
                          }}</strong>
                        </v-card-title>

                        <v-fade-transition>
                          <v-overlay v-if="hover" absolute color="#036358">
                            <v-btn
                              large
                              :to="{ path: `/post/${post.id}` }"
                              @click="pagelink(post.id)"
                              >参加ページ</v-btn
                            >
                          </v-overlay>
                        </v-fade-transition>
                      </v-img>

                      <v-card-text class="pt-6" style="position: relative;">
                        <v-btn
                          v-if="like"
                          absolute
                          color="pink lighten-1"
                          class="white--text"
                          fab
                          right
                          top
                        >
                          <v-icon>mdi-heart-off</v-icon>
                        </v-btn>
                        <v-btn
                          v-else
                          absolute
                          color="pink lighten-1"
                          class="white--text"
                          fab
                          right
                          top
                        >
                          <v-icon>mdi-heart</v-icon>
                        </v-btn>
                        <div>
                          <span class="font-weight-light grey--text title mb-2">
                            {{ post.release }} [表示させたい場所] 〜
                          </span>
                        </div>
                        <div class="font-weight-light title mb-2">
                          Our Vintage kitchen utensils delight.<br />
                        </div>
                      </v-card-text>
                    </v-sheet>
                  </template>
                </v-hover>

                <v-card>
                  <v-card-text>
                    <div class="font-weight-bold ml-8 mb-2">
                      メッセージ :
                      <!-- <user-dialog-review :users="post.reviews" :title="'メッセージしたユーザー'" /> -->
                      <br />
                      気になる :
                      <!-- <user-dialog :users="post.like_users" :title="'気になるユーザー'" /> -->
                    </div>
                  </v-card-text>

                  <v-card-actions>
                    <v-avatar size="56" class="mt-1">
                      <img
                        alt="user"
                        :src="require(`@/assets/images/default-user.png`)"
                      />
                    </v-avatar>

                    <v-spacer></v-spacer>

                    <v-menu transition="slide-y-reverse-transition">
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn
                          color="secondary"
                          class="ma-2"
                          v-bind="attrs"
                          v-on="on"
                        >
                          <v-icon>{{ 'mdi-information-outline' }}</v-icon>
                        </v-btn>
                      </template>
                      <v-list>
                        <v-list-item v-for="n in 5" :key="n" link>
                          <v-list-item-title
                            v-text="'Item ' + n"
                          ></v-list-item-title>
                        </v-list-item>
                      </v-list>
                    </v-menu>
                  </v-card-actions>
                </v-card>
              </v-responsive>
            </v-card>
          </v-col>
        </v-row>
      </v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
// import userPostList from '~/components/infoUser/UserPostList.vue'
// import userDialog from '~/components/infoUser/UserDialog.vue'
// import userDialogReview from '~/components/infoUser/UserDialogReview.vue'

export default {
  // props: {
  //   posts: {
  //     type: Array,
  //     required: true,
  //   },
  // },
  components: {
    // userPostList,
    // userDialog,
    // userDialogReview
  },
  data() {
    return {
      text:
        "I'm a thing. But, like most politicians, he promised more than he could deliver. You won't have time for sleeping, soldier, not with all the bed making you'll be doing. Then we'll go with that data file! Hey, you add a one and two zeros to that or we walk! You're going to do his laundry? I've got to find a way to escape.",
      show: false,
      like: false,
      defaultImage: require(`@/assets/images/default.png`),
      posts: [],
      start_time: '',
      finish_time: '',
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
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
    pagelink(link) {
      this.$router.push({ path: `/post/${link}` })
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
</style>
