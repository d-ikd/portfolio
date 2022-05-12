<template>
  <v-card class="list-color" flat>
    <v-list class="mx-10">
      <v-row>
        <v-list-item
          v-for="(post, i) in posts"
          :key="post.id"
          dense
          class="list list-color"
        >
          <nuxt-link :to="{ path: `/post/${post.id}` }">
            <v-list-item-avatar tile size="45">
              <v-img v-if="post.image.url" contain :src="post.image.url" />
              <v-img v-else contain :src="defaultImage" />
            </v-list-item-avatar>
          </nuxt-link>
          <v-list-item-content>
            <v-list-item-title class="list-item" @click="pagelink(post.id)">
              {{ i + number }}&emsp;&nbsp;{{ post.name }}
            </v-list-item-title>
          </v-list-item-content>
          <post-card-menu :post="post" />
        </v-list-item>
      </v-row>
    </v-list>
  </v-card>
</template>

<script>
import postCardMenu from '~/components/infoPost/PostCardMenu.vue'

export default {
  components: {
    postCardMenu,
  },
  props: {
    posts: {
      type: Array,
      required: true,
    },
    number: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require('@/assets/images/default.png'),
    }
  },
  methods: {
    pagelink(link) {
      this.$router.push({ path: `/post/${link}` })
    },
  },
}
</script>

<style scoped>
.tab {
  cursor: pointer;
}
.list-item:hover {
  opacity: 0.7;
  cursor: pointer;
}
.list:hover {
  background-color: #f5f5f5;
}
.list-color {
  background-color: #fbfbfb;
}
</style>
