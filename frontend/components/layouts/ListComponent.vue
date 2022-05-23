<template>
  <div>
    <template v-if="isMessageList">
      <v-card class="rounded-card">
        <v-timeline dense clipped>
          <template v-if="post.reviews.length === 0">
            <h4 class="ma-3 text-decoration-underline">
              メッセージがありません。
            </h4>
            <post-review-modal v-if="login" :post="post" />
          </template>
          <template v-else>
            <v-timeline-item class="mb-6" hide-dot>
              <span>TODAY</span>
            </v-timeline-item>

            <v-timeline-item
              v-for="review in post.reviews"
              :key="review.id"
              class="mb-4"
              color="grey"
              icon-color="grey lighten-2"
              small
            >
              <post-review :review="review" />

              <!-- <v-row justify="space-between">
            <v-col cols="7">
              This order was archived.
            </v-col>
            <v-col
              class="text-right"
              cols="5"
            >
              15:26 EDT
            </v-col>
          </v-row> -->
            </v-timeline-item>
          </template>

          <!-- <v-timeline-item
          class="mb-4"
          small
        >
          <v-row justify="space-between">
            <v-col cols="7">
              Digital Downloads fulfilled 1 item.
            </v-col>
            <v-col
              class="text-right"
              cols="5"
            >
              15:25 EDT
            </v-col>
          </v-row>
        </v-timeline-item> -->
        </v-timeline>
      </v-card>
    </template>
    <template v-else>
      <v-list two-line>
        <v-row>
          <v-list-item
            v-for="list in lists"
            :key="list.id"
            :ripple="false"
            class="list"
          >
            <!-- <nuxt-link :to="{ path: `/users/${user.id}` }"> -->
            <user-avatar :size="45" :user="list" class="list-avatar mx-3" />
            <!-- </nuxt-link> -->
            <v-list-item-content>
              {{ list.name }}
              <v-list-item-title
                class="list-item title"
                @click="pagelink(user.id)"
              >
                {{ list.name }}
              </v-list-item-title>
            </v-list-item-content>
            <user-follow :user="list" class="mr-3" />
          </v-list-item>
          <v-divider />
        </v-row>
      </v-list>
    </template>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userFollow from '~/components/infoUser/UserFollow.vue'
import postReviewModal from '~/components/infoPost/PostReviewModal.vue'
import postReviewList from '~/components/infoPost/PostReviewList.vue'
import postReview from '~/components/infoPost/PostReview.vue'

export default {
  components: {
    userAvatar,
    userFollow,
    postReviewModal,
    postReviewList,
    postReview,
  },
  props: {
    lists: {
      type: Array,
      default: () => ({}),
      required: true,
    },
    post: {
      type: Object,
      required: true,
    },
    isMessageList: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      icon: require('@/assets/images/default-user.png'),
      follow: false,
    }
  },
  computed: {
    ...mapGetters({
      /* loginUser: 'auth/loginUser',
      user: 'user/user',
      login: 'auth/isLoggedIn', */
    }),
  },
  methods: {
    pagelink(link) {
      this.$router.push({ path: `/users/${String(link)}` })
    },
  },
}
</script>

<style scoped>
.list-item {
  cursor: pointer;
}
.list-avatar {
  cursor: pointer;
}
.list-item:hover {
  opacity: 0.7;
}
.list-avatar:hover {
  opacity: 0.7;
}
.list:hover {
  transition: 0.2s;
  background-color: #f5f5f5;
}
.list {
  cursor: default;
}
</style>
