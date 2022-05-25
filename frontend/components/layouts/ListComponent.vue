<template>
  <div>
    <template v-if="isFollow">
      <v-list>
        <v-row>
          <v-list-item
            v-for="list in lists"
            :key="list.id"
            :ripple="false"
            class="list"
          >
            <user-avatar :size="45" :user="list" class="list-avatar mx-3" />
            <v-list-item-content>
              <v-list-item-title
                class="list-item title"
                @click="pagelink(list.user.id)"
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
    <template v-if="isMessageList">
      <v-card class="rounded-card">
        <template v-if="post.reviews.length === 0">
          <h4 class="ma-3">
            メッセージがありません。
          </h4>
          <the-modal-message-create v-if="login" :post="post" />
        </template>
        <template>
          <v-sheet
            v-for="review in post.reviews"
            :key="review.id"
            class="mb-3 mt-3"
          >
            <message :message="review" />
          </v-sheet>
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
            <post-message :message="list" />
          </v-card>
        </v-list>
      </v-card>
    </template>
    <template v-else> </template>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userFollow from '~/components/infoUser/UserFollow.vue'
import postMessage from '~/components/infoPost/PostMessage.vue'
import message from '~/components/infoPost/Message.vue'
import theModalMessageCreate from '~/components/layouts/TheModalMessageCreate.vue'

export default {
  components: {
    userAvatar,
    userFollow,
    postMessage,
    message,
    theModalMessageCreate,
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
    isFollow: {
      type: Boolean,
      default: false,
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
