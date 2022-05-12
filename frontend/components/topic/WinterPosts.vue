<template>
  <v-card flat>
    <v-list>
      <v-row>
        <v-list-item
          v-for="f in total"
          :key="f.id"
          :ripple="false"
          class="list"
        >
          <v-list-item-avatar tile>
            <v-img v-if="f.post.image.url" contain :src="f.post.image.url" />
            <v-img v-else contain :src="defaultImage" />
          </v-list-item-avatar>
          <v-list-item-title class="list-item" @click="pagelink(f.post.id)">
            {{ f.post.name }}
          </v-list-item-title>
          <post-card-menu :post="f.post" />
        </v-list-item>
      </v-row>
      <!-- </v-list-item-group> -->
    </v-list>
  </v-card>
</template>

<script>
import postCardMenu from '~/components/PostCardMenu.vue'

export default {
  components: {
    postCardMenu,
  },
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
      if (this.cate.onigiri) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('おにぎり') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.bento) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('お弁当') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.sandwich) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('サンドイッチ') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.pan) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('パン') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.noudle) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('麺類') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.sideDish) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('惣菜') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.soup) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('スープ') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.salad) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('サラダ') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.fried) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('揚げ物') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.chinese) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('中華まん') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.gratin) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('グラタン・ドリア') !== -1) {
            result.push(value)
          }
        })
      }
      if (this.cate.dessert) {
        this.posts.filter((value) => {
          if (value.post.category.indexOf('デザート') !== -1) {
            result.push(value)
          }
        })
      }
      if (
        !this.cate.onigiri &&
        !this.cate.bento &&
        !this.cate.sandwich &&
        !this.cate.pan &&
        !this.cate.noudle &&
        !this.cate.sideDish &&
        !this.cate.soup &&
        !this.cate.salad &&
        !this.cate.fried &&
        !this.cate.chinese &&
        !this.cate.gratin &&
        !this.cate.dessert
      ) {
        this.posts.filter((value) => {
          result.push(value)
        })
      }
      return result
    },
    total() {
      const result = this.sortPosts
      const res = []
      if (this.make.seven) {
        result.filter((value) => {
          if (value.post.maker.indexOf('セブンイレブン') !== -1) {
            res.push(value)
          }
        })
      }
      if (this.make.loson) {
        result.filter((value) => {
          if (value.post.maker.indexOf('ローソン') !== -1) {
            res.push(value)
          }
        })
      }
      if (this.make.famima) {
        result.filter((value) => {
          if (value.post.maker.indexOf('ファミリーマート') !== -1) {
            res.push(value)
          }
        })
      }
      if (this.make.mini) {
        result.filter((value) => {
          if (value.post.maker.indexOf('ミニストップ') !== -1) {
            res.push(value)
          }
        })
      }
      if (
        !this.make.seven &&
        !this.make.loson &&
        !this.make.famima &&
        !this.make.mini
      ) {
        result.filter((value) => {
          res.push(value)
        })
      }
      return res
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
