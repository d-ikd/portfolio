<template>
  <v-card flat>
    <p>test</p>

    <v-list>
      <v-row>
        <template v-for="post in sortposts">
          <v-list-item :key="post.id" :ripple="false" class="list">
            <v-list-item-avatar tile>
              <v-img v-if="post.image.url" contain :src="post.image.url" />
              <v-img v-else contain :src="defaultImage" />
            </v-list-item-avatar>
            <v-list-item-title class="list-item" @click="pagelink(post.id)">
              <span class="ml-3">{{ post.name }}</span>
            </v-list-item-title>
            <div class="mr-1">
              <v-rating
                v-model="post.avg_rate"
                background-color="orange lighten-1"
                color="orange darken-2"
                readonly
                half-increments
                dense
                x-small
              />
              <span class="pl-7">{{ post.avg_rate.toFixed(1) }}</span>
            </div>
            <div class="mr-2">
              <v-icon> mdi-silverware-fork-knife </v-icon>
              <span class="pl-2">{{ post.like_users.length }}</span>
            </div>
            <!-- <post-card-menu :post="post" /> -->
          </v-list-item>
        </template>
      </v-row>
    </v-list>
  </v-card>
</template>

<script>
export default {
  props: {
    posts: {
      type: Array,
      required: true,
    },
    category: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require('@/assets/images/default.png'),
      resultPost: [],
    }
  },
  computed: {
    sortPosts() {
      const result = []
      if (this.category.indoor) {
        this.posts.filter((value) => {
          if (value.category.includes('インドア')) {
            result.push(value)
          }
        })
      }
      if (this.category.outdoor) {
        this.posts.filter((value) => {
          if (value.category.includes('アウトドア')) {
            result.push(value)
          }
        })
      }
      if (!this.category.indoor && !this.category.outdoor) {
        this.posts.filter((value) => {
          result.push(value)
        })
      }
      return result
    },
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
.list-item {
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
