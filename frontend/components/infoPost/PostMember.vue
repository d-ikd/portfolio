<template>
  <v-sheet class="d-flex transparent align-center flex-column">
    <div
      class="headline
                    mr-8 pink--text font-weight-bold no-wrap-text"
    >
      <v-row no-gutters>
        <v-col> </v-col>
        <v-col cols="sm" class="text-center align-self-center">
          <v-sheet elevation="4" class="rounded-pill mt-3 mb-3">
            <v-chip label color="transparent" x-large text-color="purple">
              <v-icon class="ml-2 mr-2">mdi-account-circle</v-icon>
              {{ title }} [ {{ users.length }} / {{ post.member }} ] 人
            </v-chip>
          </v-sheet>
        </v-col>
        <v-col> </v-col>
      </v-row>

      <v-card class="d-flex flex-row mb-6 rounded-card" flat tile>
        <v-sheet
          v-for="user in users"
          :key="user.id"
          class="text-center align-self-center"
          color="white"
        >
          <nuxt-link :to="{ path: `/users/${user.id}` }">
            <user-avatar :size="100" :user="user" class="list-avatar mx-3" />
          </nuxt-link>
          {{ user.name }}
        </v-sheet>
      </v-card>
    </div>
  </v-sheet>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
/* import userFollow from '~/components/infoUser/UserFollow.vue' */

export default {
  components: {
    userAvatar,
    /* userFollow, */
  },
  props: {
    post: {
      type: Object,
      default: () => {},
      required: true,
    },
    users: {
      type: Array,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
      dialog: false,
    }
  },
  computed: {
    ...mapGetters({
      loginuser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
  },
  methods: {
    pagelink(link) {
      this.$router.push({ path: `/users/${link}` })
    },
  },
}
</script>

<style scoped>
.rounded-card {
  border-radius: 20px;
}
.signup-link {
  color: #2196f3;
  cursor: pointer;
}
.signup-link:hover {
  opacity: 0.8;
  text-decoration: underline;
}
.list-item {
  cursor: pointer;
}
.list-avatar {
  cursor: pointer;
}
.list:hover {
  transition: 0.3s;
  background-color: #f5f5f5;
}
.list {
  cursor: default;
}
</style>
