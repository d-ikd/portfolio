<template>
  <v-card flat>
    <v-list>
      <v-row>
        <template v-for="(post, i) in sortPosts">
          <v-list-item :key="post.id" :ripple="false" class="list">
            <v-list-item-avatar tile>
              <v-img v-if="post.image.url" contain :src="post.image.url" />
              <v-img v-else contain :src="defaultImage" />
            </v-list-item-avatar>
            <v-list-item-title class="list-item" @click="pagelink(post.id)">
              {{ i + 1 }}<span class="ml-3">{{ post.name }}</span>
            </v-list-item-title>
            <div class="mr-2">
              <v-icon> mdi-heart </v-icon>
              <span class="pl-2">{{ post.like_users.length }}</span>
            </div>
          </v-list-item>
        </template>
      </v-row>
    </v-list>
  </v-card>
</template>

<script>
export default {
  components: {},
  props: {
    posts: {
      type: Array,
      required: true,
    },
    cate: {
      type: Array,
      required: true,
    },
    make: {
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
    sortPosts() {
      const result = []
      if (this.cate.indoor) {
        this.posts.filter((value) => {
          if (value.category.includes('インドア')) {
            result.push(value)
          }
        })
      }
      if (this.cate.outdoor) {
        this.posts.filter((value) => {
          if (value.category.includes('アウトドア')) {
            result.push(value)
          }
        })
      }
      if (!this.cate.indoor && !this.cate.outdoor) {
        this.posts.filter((value) => {
          result.push(value)
        })
      }
      return result
        .slice()
        .sort((a, b) => {
          if (a.like_users.length < b.like_users.length) return 1
          if (a.like_users.length > b.like_users.length) return -1
          return 0
        })
        .slice(0, 10)
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
  width: 100px;
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
