<template>
  <div style="background-color: white">
    <v-carousel hide-delimiters height="auto">
      <v-carousel-item>
        <v-row>
          <v-col
            v-for="post in posts"
            :key="post.id"
            class="d-flex child-flex flex-wrap"
            cols="4"
          >
            <v-card
              :elevation="15"
              dark
              class="green secondary ma-3 rounded-card"
            >
              <v-responsive :aspect-ratio="9 / 16">
                <v-hover>
                  <template v-slot:default="{ hover }">
                    <v-sheet dark flat color="white">
                      <v-img
                        v-if="post.image.url"
                        contain
                        :src="post.image.url"
                        :aspect-ratio="1 / 1"
                        class="white--text align-end"
                      >
                        <!-- <v-img v-else contain :src="defaultImage"> -->

                        <v-card-title>
                          <strong
                            class="display-2 font-weight-regular"
                            gradient="to top, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                          >
                            {{ post.name }}</strong
                          >
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
                        <button-like
                          :user="user"
                          :post="post"
                          :fronttitle="frontTitle"
                          :backtitle="backTitle"
                        />

                        <div>
                          <span class="font-weight-light grey--text title mb-2">
                            {{ $dayjs(post.release).format('MM/DD') }}
                            ( {{ $dayjs(post.start_time).format('hh:mm') }}~{{
                              $dayjs(post.finish_time).format('hh:mm')
                            }}
                            ) <br />@{{ post.place }}
                          </span>
                        </div>
                      </v-card-text>
                      <v-avatar size="56" class="mt-1">
                        <img
                          alt="user"
                          :src="require(`@/assets/images/default-user.png`)"
                        />
                      </v-avatar>

                      <v-menu transition="slide-y-reverse-transition">
                        <template v-slot:activator="{ on, attrs }">
                          <v-btn
                            color="secondary"
                            class="ma-2"
                            v-bind="attrs"
                            outlined
                            v-on="on"
                          >
                            <v-icon>{{ 'mdi-information-outline' }}</v-icon>
                          </v-btn>
                        </template>

                        <v-card color="white" max-width="600" min-width="200">
                          <v-card
                            :elevation="15"
                            dark
                            class="green secondary ma-3 rounded-card"
                          >
                            <v-responsive :aspect-ratio="9 / 16">
                              <v-hover>
                                <template v-slot:default="{ hover }">
                                  <v-sheet dark flat color="white">
                                    <v-img
                                      v-if="post.image.url"
                                      contain
                                      :src="post.image.url"
                                      :aspect-ratio="1 / 1"
                                      class="white--text align-end"
                                    >
                                      <!--!!!!!!!!!!!! :aspect-ratio="16/9" !!!!!!!!!!!!-->
                                      <!-- <v-img v-else contain :src="defaultImage"> -->

                                      <v-card-title>
                                        <strong
                                          class="display-2 font-weight-regular"
                                          gradient="to top, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                                        >
                                          <!-- gradient="to top, rgba(0,0,0,.1), rgba(0,0,0,.5)" -->
                                          {{ post.name }}</strong
                                        >
                                      </v-card-title>

                                      <v-fade-transition>
                                        <v-overlay
                                          v-if="hover"
                                          absolute
                                          color="#036358"
                                        >
                                          <v-btn
                                            large
                                            :to="{ path: `/post/${post.id}` }"
                                            @click="pagelink(post.id)"
                                            >参加ページ</v-btn
                                          >
                                        </v-overlay>
                                      </v-fade-transition>
                                    </v-img>

                                    <v-card-text
                                      class="pt-6"
                                      style="position: relative;"
                                    >
                                      <div>
                                        <span
                                          class="font-weight-light grey--text title mb-2"
                                        >
                                          {{
                                            $dayjs(post.release).format('MM/DD')
                                          }}
                                          (
                                          {{
                                            $dayjs(post.start_time).format(
                                              'hh:mm'
                                            )
                                          }}~{{
                                            $dayjs(post.finish_time).format(
                                              'hh:mm'
                                            )
                                          }}
                                          ) <br />@{{ post.place }}
                                        </span>
                                      </div>
                                    </v-card-text>
                                    <v-avatar size="56" class="mt-1">
                                      <img
                                        alt="user"
                                        :src="
                                          require(`@/assets/images/default-user.png`)
                                        "
                                      />
                                    </v-avatar>
                                    <div align="right">
                                      <v-menu
                                        transition="slide-y-reverse-transition"
                                      >
                                        <template
                                          v-slot:activator="{ on, attrs }"
                                        >
                                          <v-btn
                                            color="secondary"
                                            class="ma-2"
                                            v-bind="attrs"
                                            outlined
                                            v-on="on"
                                          >
                                            <v-icon>{{
                                              'mdi-information-outline'
                                            }}</v-icon>
                                          </v-btn>
                                        </template>

                                        <v-card
                                          color="white"
                                          max-width="600"
                                          min-width="200"
                                        >
                                          <v-card color="white" class="mx-auto">
                                            <v-card-header
                                              class="overline mb-4"
                                            >
                                              詳細
                                            </v-card-header>
                                            <v-card-text>
                                              <div
                                                class="font-weight-bold ml-8 mb-2"
                                              >
                                                {{ post.details }}
                                              </div>
                                            </v-card-text>
                                          </v-card>
                                          <v-container
                                            class="ma-10"
                                            width="300px"
                                          >
                                            <v-simple-table height="300px">
                                              <template v-slot:default>
                                                <tbody>
                                                  <tr></tr>
                                                  <tr>
                                                    <td>日付</td>
                                                    <td>{{ post.name }}</td>
                                                  </tr>
                                                  <tr>
                                                    <td>時間</td>
                                                    <td>{{ post.name }}</td>
                                                  </tr>
                                                </tbody>
                                              </template>
                                            </v-simple-table>
                                          </v-container>
                                        </v-card>
                                      </v-menu>
                                    </div>
                                  </v-sheet>
                                </template>
                              </v-hover>

                              <v-card-text>
                                <div class="font-weight-bold">
                                  <br />
                                  <v-icon>mdi-heart</v-icon> (
                                  <user-dialog
                                    :users="post.like_users"
                                    :title="'気になるユーザー'"
                                  />
                                  ) <v-icon>mdi-run</v-icon> (<user-dialog
                                    :users="post.like_users"
                                    :title="'気になるユーザー'"
                                  />
                                  / {{ post.member }} )

                                  <v-sheet class="green lighten-2 mb-4">
                                    <v-timeline align-top dense>
                                      <v-timeline-item
                                        color="white lighten-3"
                                        fill-dot
                                        small
                                      >
                                        <v-row class="pt-1">
                                          <v-col cols="3">
                                            <strong
                                              >集合:
                                              {{ post.start_time }}</strong
                                            >
                                          </v-col>
                                          <v-col>
                                            <strong
                                              >場所: {{ post.place }} /
                                              募集メンバー:
                                              {{ post.member }}人</strong
                                            >
                                            <div class="caption mb-2">
                                              予算: {{ post.price }}円/人
                                            </div>
                                            <v-avatar>
                                              <v-img
                                                src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairFrida&accessoriesType=Kurt&hairColor=Red&facialHairType=BeardLight&facialHairColor=BrownDark&clotheType=GraphicShirt&clotheColor=Gray01&graphicType=Skull&eyeType=Wink&eyebrowType=RaisedExcitedNatural&mouthType=Disbelief&skinColor=Brown"
                                              ></v-img>
                                            </v-avatar>
                                            <v-avatar>
                                              <v-img
                                                src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairStraight&accessoriesType=Blank&hairColor=BrownDark&facialHairType=Blank&clotheType=BlazerShirt&eyeType=Default&eyebrowType=Default&mouthType=Default&skinColor=Light"
                                              ></v-img>
                                            </v-avatar>
                                            <v-avatar>
                                              <v-img
                                                src="https://avataaars.io/?avatarStyle=Circle&topType=LongHairMiaWallace&accessoriesType=Sunglasses&hairColor=BlondeGolden&facialHairType=Blank&clotheType=BlazerSweater&eyeType=Surprised&eyebrowType=RaisedExcited&mouthType=Smile&skinColor=Pale"
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
                                              {{ post.finish_time }}</strong
                                            >
                                          </v-col>
                                        </v-row>
                                      </v-timeline-item>
                                    </v-timeline>
                                  </v-sheet>

                                  <v-simple-table>
                                    <template v-slot:default>
                                      <tbody>
                                        <tr></tr>
                                        <tr>
                                          <td>日付</td>
                                          <td>{{ post.name }}</td>
                                        </tr>
                                        <tr>
                                          <td>時間</td>
                                          <td>
                                            {{ post.start_time }} 〜
                                            {{ post.start_time }}
                                          </td>
                                        </tr>
                                      </tbody>
                                    </template>
                                  </v-simple-table>
                                </div>
                              </v-card-text>
                            </v-responsive>
                          </v-card>

                          <v-card color="white" class="mx-auto">
                            <v-card-header class="overline mb-4">
                              詳細
                            </v-card-header>
                            <v-card-text>
                              <div class="font-weight-bold ml-8 mb-2">
                                {{ post.details }}
                              </div>
                            </v-card-text>
                          </v-card>
                        </v-card>
                      </v-menu>
                    </v-sheet>
                  </template>
                </v-hover>

                <v-card-text>
                  <div class="font-weight-bold ml-8 mb-2">
                    <br />
                    <v-icon>mdi-heart</v-icon> (
                    <user-dialog
                      :users="post.like_users"
                      :title="'気になるユーザー'"
                    />
                    ) <v-icon>mdi-run</v-icon> (<user-dialog
                      :users="post.like_users"
                      :title="'気になるユーザー'"
                    />
                    / {{ post.member }} )
                  </div>
                </v-card-text>
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
import userDialog from '~/components/infoUser/UserDialog.vue'
import userDialogReview from '~/components/infoUser/UserDialogReview.vue'
import buttonLike from '~/components/infoPost/ButtonLike.vue'
import scheduleCardContents from '~/components/ScheduleCardContents.vue'

export default {
  // props: {
  //   posts: {
  //     type: Array,
  //     required: true,
  //   },
  // },
  components: {
    // userPostList,
    userDialog,
    userDialogReview,
    buttonLike,
    scheduleCardContents,
  },
  data() {
    return {
      frontTitle: 'Norika',
      backTitle: 'Yuri',
      loading: false,
      like: false,
      join: false,

      show: false,

      defaultImage: require(`@/assets/images/default.png`),
      posts: [],
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
      user: 'auth/loginUser',
      login: 'auth/isLoggedIn',
      currentPosts: 'favOrNotCheck/posts',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
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
