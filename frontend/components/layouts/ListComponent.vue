<template>
  <div>
    <template v-if="isMessageList">
      <v-card class="rounded-card">
        <template v-if="post.reviews.length === 0">
          <h4 class="ma-3 text-decoration-underline">
            メッセージがありません。
          </h4>
          <the-modal-message-create v-if="login" :post="post" />
        </template>
        <template>
          <v-timeline dense clipped>
            <v-timeline-item
              v-for="review in post.reviews"
              :key="review.id"
              class="mb-4"
              color="grey"
              icon-color="grey lighten-2"
              small
            >
              <post-review :review="review" />
            </v-timeline-item>
          </v-timeline>
        </template>
      </v-card>
    </template>
    <template v-if="isMessageListInId">
      <v-card flat style="background-color: white">
        <v-list style="background-color: white">
          <v-card
            v-for="list in lists"
            :key="list.id"
            flat
            class="mb-2"
            style="background-color: white"
          >
            <post-review2 :review="list" />
          </v-card>
        </v-list>
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
import theModalMessageCreate from '~/components/layouts/TheModalMessageCreate.vue'
import postReviewList from '~/components/infoPost/PostReviewList.vue'
import postReview from '~/components/infoPost/PostReview.vue'
import postReview2 from '~/components/infoPost/PostReview2.vue'

export default {
  components: {
    userAvatar,
    userFollow,
    theModalMessageCreate,
    postReviewList,
    postReview,
    postReview2,
  },
  props: {
    lists: {
      type: Array,
      default: () => ({}),
      required: false,
    },
    post: {
      type: Object,
      default: () => ({}),
      required: false,
    },
    isMessageList: {
      type: Boolean,
      default: false,
    },
    isMessageListInId: {
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
      /*       loginUser: 'auth/loginUser',
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
