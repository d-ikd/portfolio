<template>
  <v-list>
    <v-row>
      <v-list-item
        v-for="post in posts"
        :key="post.id"
        :ripple="false"
        class="list"
      >
        <v-list-item-avatar tile class="tab">
          <v-avatar size="50">
            <v-img v-if="post.image.url" :src="post.image.url" />
            <v-img v-else contain :src="defaultImage" />
          </v-avatar>
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title class="list-item title" @click="pagelink(user.id)">
            {{ post.name }}
          </v-list-item-title>
        </v-list-item-content>

        <div align-self="center">
          <button-like :user="loginUser" :post="post" :is-rounded-join="true" />
        </div>

        <!-- <v-list-item-title class="list-item" @click="pagelink(post.id)">
            {{ post.name }}
          </v-list-item-title>
          <schedule-card-info :post="post" /> -->
      </v-list-item>
    </v-row>
  </v-list>
</template>

<script>
import { mapGetters } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'

export default {
  components: {
    buttonLike,
  },
  props: {
    posts: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require('@/assets/images/default.png'),
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
    }),
  },
}
</script>

<style scoped>
.tab {
  cursor: pointer;
}
/* .list-item {
  width: 100px;
  cursor: pointer;
} */
.list:hover {
  transition: 0.3s;
  background-color: #f5f5f5;
}
.list {
  cursor: default;
}

.small-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
/* .small-image:hover {
  opacity: 0.7;
}
 */
</style>
