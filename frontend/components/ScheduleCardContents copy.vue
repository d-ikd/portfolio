<template>
  <v-card :elevation="15" dark class="green secondary ma-3 rounded-card">
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
                :user="useruser"
                :post="postpost"
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

            <!-- <schedule-card-info :post="post" :user=user /> -->
          </v-sheet>
        </template>
      </v-hover>
      <!--
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
                </v-card-text> -->
    </v-responsive>
  </v-card>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import buttonLike from '~/components/infoPost/Buttonlike.vue'
import userDialog from '~/components/infoUser/UserDialog.vue'
import userDialogReview from '~/components/infoUser/UserDialogReview.vue'
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import scheduleCardContents from '~/components/ScheduleCardContents.vue'

export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
    user: {
      type: Object,
      required: true,
    },
  },
  components: {
    buttonLike,
    userDialog,
    userDialogReview,
    scheduleCardContents,
    scheduleCardInfo,
  },
  data() {
    return {
      frontTitle: 'Hi',
      backTitle: 'Ho',
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
      postpost: 'post/post',
      useruser: 'auth/loginUser',
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
