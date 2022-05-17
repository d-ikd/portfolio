<template>
    <v-container>
      <button-like :user="user" :post="post" :fronttitle="frontTitle" :backtitle="backTitle" :status1="status1" :status2="status2" />
      <v-row>
        <v-col cols="12">
          <v-sheet elevation="10" rounded="xl" class="green lighten-2">
            <v-sheet class="pl-5 primary" dark rounded="t-xl">
              <div>
                <div class="my-5 show-rate">
                  <span>
                    <h3>
                      <v-avatar size="60">
                        <v-img
                          src="https://avataaars.io/?avatarStyle=Circle&topType=ShortHairFrizzle&accessoriesType=Prescription02&hairColor=Black&facialHairType=MoustacheMagnum&facialHairColor=BrownDark&clotheType=BlazerSweater&clotheColor=Black&eyeType=Default&eyebrowType=FlatNatural&mouthType=Default&skinColor=Tanned"
                        ></v-img>
                      </v-avatar>
                      {{ user.name }} さんが投稿
                      <button-like :user="user" :post="post" :fronttitle="frontTitle" :backtitle="backTitle" :status1="status1" :status2="status2" />
                    </h3>
                  </span>
                  <span class="pr-3">
                    {{ createDate }}
                  </span>
                </div>
              </div>
            </v-sheet>
            <v-sheet class="green lighten-2">
              <v-row no-gutters>
                <v-col cols="6">
                  <!-- <post-container-like :post="post" /> -->
                </v-col>
                <v-col cols="6">
                  <post-container-timeline :post="post" />
                </v-col>
              </v-row>
            </v-sheet>

            <v-row no-gutters>
              <v-col cols="12" sm="6">
                <v-sheet
                  class="green lighten-2 mb-4"
                  align="center"
                  justify="center"
                >
                  <v-btn
                    v-if="like"
                    class="mx-5"
                    color="red white--text font-weight-bold"
                    outlined
                    @click="nice"
                  >
                    <v-icon>mdi-heart-off</v-icon>
                    「気になる」から外す
                  </v-btn>
                  <v-btn
                    v-else
                    class="mx-5"
                    color="green white--text font-weight-bold"
                    @click="nice"
                  >
                    <v-icon class="mr-1">mdi-heart</v-icon>
                    気になる！
                  </v-btn>
                </v-sheet>
              </v-col>
              <v-col cols="12" sm="6">
                <div align="center" justify="center" class="mt5">
                  <v-btn
                    v-if="join"
                    class="mx-5"
                    color="red white--text font-weight-bold"
                    outlined
                    @click="joining"
                  >
                    <v-icon>mdi-close-circle-outline</v-icon>
                    「参加する」から外す
                  </v-btn>
                  <v-btn
                    v-else
                    class="mx-5"
                    color="green white--text font-weight-bold"
                    @click="joining"
                  >
                    <v-icon class="mr-1">mdi-walk</v-icon>
                    参加する！
                  </v-btn>
                </div>
              </v-col>
            </v-row>
          </v-sheet>
        </v-col>
      </v-row>
    </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
// import postContainerLike from '~/components/infoPost/PostContainerLike.vue'
import postContainerTimeline from '~/components/infoPost/PostContainerTimeline.vue'
import buttonLike from '~/components/infoPost/ButtonLike.vue'


export default {
  components: {
    // postContainerLike,
    postContainerTimeline,
    buttonLike,
  },
  data() {
    return {
      backTitle: '表！',
      frontTitle: '裏…',
      loading: false,
      like: false,
      join: false,
      add: false,
      createDate: '',
      releaseDate: '',
      start_time: '',
      finish_time: '',
      defaultImage: require('@/assets/images/default-user.png'),
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
  },

  created() {
    this.$axios
      .get(`api/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.$store.commit('post/setPost', res.data, { root: true })
      })
      .then(() => {
        if (this.login) {
          this.post.like_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.like = true
            }
          })
          this.add = false
          this.currentPosts.forEach((f) => {
            if (f.id === this.post.id) {
              this.add = true
            }
          })
        }
      })
      .then(() => {
        if (this.login) {
          this.post.join_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.join = true
            }
          })
          this.add = false
          this.currentPosts.forEach((f) => {
            if (f.id === this.post.id) {
              this.add = true
            }
          })
        }
        this.createDate = this.$dayjs(this.post.updated_at).format(
          'YYYY年MM月DD日'
        )
        this.releaseDate = this.$dayjs(this.post.release).format('YYYY/MM/DD')
        this.releaseYear = this.$dayjs(this.post.release).format('YYYY')
        this.releaseMonth = this.$dayjs(this.post.release).format('MM')
        this.releaseDay = this.$dayjs(this.post.release).format('DD')
        this.start_time = this.$dayjs(this.post.start_time).format('hh:mm')
        this.finish_time = this.$dayjs(this.post.finish_time).format('hh:mm')
        this.loading = true
      })
  },
}
</script>

<style scoped>
.show-rate {
  font-size: 20px;
  font-weight: 200;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
</style>
