<template>
  <v-list two-line>
    <v-row>
      {{ lists }}
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
          <v-list-item-title class="list-item title" @click="pagelink(user.id)">
            {{ list.name }}
          </v-list-item-title>
        </v-list-item-content>
        <user-follow :user="list" class="mr-3" />
      </v-list-item>
      <v-divider />
    </v-row>
  </v-list>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userFollow from '~/components/infoUser/UserFollow.vue'

export default {
  components: {
    userAvatar,
    userFollow,
  },
  props: {
    lists: {
      type: Array,
      default: () => ({}),
      required: true,
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
      loginUser: 'auth/loginUser',
      user: 'user/user',
      login: 'auth/isLoggedIn',
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
