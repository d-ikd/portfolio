<template>
  <v-card>
    <v-sheet class="d-flex transparent align-center flex-column">
      <div class="headline mr-8 pink--text font-weight-bold no-wrap-text">
        <v-chip>
          {{ title }} [ {{ users.length }} / {{ post.member }} ] 人
        </v-chip>

        <v-card class="d-flex flex-row mb-6 rounded-card" flat tile>
          <v-sheet v-for="user in users" :key="`first-${user}`">
            <nuxt-link :to="{ path: `/users/${user.id}` }">
              <user-avatar :size="100" :user="user" class="list-avatar mx-3" />
            </nuxt-link>
          </v-sheet>
        </v-card>
      </div>
    </v-sheet>
  </v-card>
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
