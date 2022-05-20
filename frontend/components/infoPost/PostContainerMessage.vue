<template>
  <v-container>
    <v-row justify="center">
      <!--       <v-col cols="12">
        <v-sheet elevation="10" rounded="xl" class="green lighten-2">
          <v-sheet dark rounded="t-xl"> </v-sheet>

          <div class="pa-4">
            <v-tabs
              v-model="tab"
              background-color="transparent"
              class="green lighten-2 white--text font-weight-bold"
              grow
              icons-and-text
              dark
              center-active
            >
              <v-tab v-for="(item, index) in items" :key="index">
                <h3 class="pl-2 mb-2">
                  <v-icon>{{ item.icon }}</v-icon>
                  {{ item.title }}
                  <span>（{{ post.reviews.length }}）</span>
                </h3>
              </v-tab>

              <v-tabs-items v-model="tab">
                <v-tab-item>
                  <v-row>
                    <v-col>
                      <template v-if="post.reviews.length === 0">
                        <h4 class="ma-3 text-decoration-underline">
                          メッセージがありません。
                        </h4>
                        <post-review-modal v-if="login" :post="post" />
                      </template>
                      <template v-else>
                        <post-review-list :reviews="post.reviews" />
                      </template>
                    </v-col>
                  </v-row>
                </v-tab-item>
                <v-tab-item>
                  <p>test</p>
                </v-tab-item>
              </v-tabs-items>
            </v-tabs>
          </div>
        </v-sheet>
      </v-col> -->
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import postReviewModal from '~/components/infoPost/PostReviewModal.vue'
import postReviewList from '~/components/infoPost/PostReviewList.vue'

export default {
  /*       props: {
    post: {
      type: Object,
      required: true,
    },
  }, */
  components: {
    postReviewModal,
    postReviewList,
  },

  data() {
    return {
      items: [
        {
          icon: 'mdi-email-outline',
          title: 'メッセージ',
        },
        {
          icon: 'mdi-file-document-box',
          title: '感想・アンケート',
        },
      ],
      tab: null,
      review: true,
      add: false,
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
  watch: {
    loginUserReview() {
      // ユーザーがすでにレビューを投稿してたら非表示にする
      if (this.login) {
        this.review = true
        this.post.reviews.forEach((f) => {
          if (f.user_id === this.user.id) {
            this.review = false
          }
        })
        this.add = false
        this.currentPosts.forEach((f) => {
          if (f.id === this.post.id) {
            this.add = true
          }
        })
      }
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
        this.loading = true
      })
  },
}
</script>

<style scoped></style>
