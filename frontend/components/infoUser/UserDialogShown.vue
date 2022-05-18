<template>
  <v-card class="ma-0">
    <v-row>
      {{ title }}
      <span> （{{ users.length }}） </span>

      <v-col
        v-for="user in users"
        :key="user.id"
        class="d-flex child-flex"
        cols="4"
      >
        <nuxt-link :to="{ path: `/users/${user.id}` }">
          <user-avatar :size="45" :user="user" class="list-avatar mx-3" />
        </nuxt-link>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import userFollow from '~/components/infoUser/UserFollow.vue'

export default {
  components: {
    userAvatar,
    userFollow,
  },
  props: {
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
  methods: {
    pagelink(link) {
      this.$router.push({ path: `/users/${link}` })
    },
  },
}
</script>

<style scoped>
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
