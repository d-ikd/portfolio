<template>
  <v-menu
    :key="login"
    v-model="menu"
    transition="slide-x-reverse-transition"
    min-width="200px"
    max-width="350px"
    rounded
    offset-x
    internal-activator
    left
  >
    <!--
    <template #activator="{ on, attrs }">
      <template v-if="like">
        <v-btn v-bind="attrs" icon text :ripple="false" v-on="on">
          <v-icon color="grey darken-1" v-on="on">
            mdi-silverware-fork-knife
          </v-icon>
        </v-btn>
      </template>
      <template v-else>
        <v-btn v-bind="attrs" icon text color="grey" :ripple="false" v-on="on">
          <v-icon v-on="on"> mdi-dots-horizontal </v-icon>
        </v-btn>
      </template>
    </template> -->

    <v-card>
      <!--
      <v-list-item two-line :to="{ path: `/post/${post.id}` }">
        <v-list-item-avatar>
          <v-img v-if="post.image.url" :src="post.image.url" />
          <v-img v-else :src="defaultImage" />
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title>
            {{ post.name }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <div class="text-center">
        <v-btn
          block
          depressed
          text
          :to="{ path: `/post/${post.id}` }"
          class="py-6"
        >
          詳細
        </v-btn>
        <v-divider />
        <template v-if="login">
          <v-btn v-if="like" block depressed text class="py-6" @click="nice">
            食べたいから解除
          </v-btn>
          <v-btn v-else block depressed text class="py-6" @click="nice">
            食べたい！
          </v-btn>
          <v-divider /> -->
      <!--
          <v-btn
            v-if="add"
            block
            depressed
            text
            class="py-6"
            @click="deletePost(post)"
          >
            献立から解除
          </v-btn>
          <v-btn
            v-else
            block
            depressed
            text
            class="py-6"
            @click="addPost(post)"
          >
            献立に追加
          </v-btn> -->
      <!--
        </template>
      </div> -->
    </v-card>
  </v-menu>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      /*
      menu: false,
      liking: [],
      like: Boolean,
      users: this.post.like_users,
      defaultImage: require("@/assets/images/default.png"),
      add: false, */
    }
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
      currentUser: 'auth/currentUser',
      login: 'auth/isLoggedIn',
      /* todayPosts: "choise/posts", */
    }),

    update() {
      return this.$store.state.auth.isLoggedIn
    },
    /*
    addChoisePost() {
      return this.$store.state.choise.posts
    }, */
  },
  /*
  watch: {
    update() {
      if (this.login) {
        this.loginUser.postlike.forEach((post) => {
          if (post.name === this.post.name) {
            this.liking.push(post.name)
          }
        })
        if (this.liking[0] === this.post.name) {
          this.like = true
        } else {
          this.like = false
        }
      } else {
        this.like = false
      }
    },
    addChoisePost() {
      if (this.login) {
        this.add = false
        this.todayPosts.forEach((f) => {
          if (f.id === this.post.id) {
            this.add = true
          }
        })
      }
    },
  }, */
  /*
  created() {
    if (this.login) {
      this.loginUser.postlike.forEach((post) => {
        if (post.name === this.post.name) {
          this.liking.push(post.name)
        }
      })
      if (this.liking[0] === this.post.name) {
        this.like = true
      } else {
        this.like = false
      }
      this.add = false
      this.todayPosts.forEach((f) => {
        if (f.id === this.post.id) {
          this.add = true
        }
      })
    } else {
      this.like = false
    }
  }, */
  methods: {
    ...mapActions({
      likePost: 'post/likePost',
      unLikePost: 'post/unLikePost',
      /* addPost: "choise/addPost", */
      /* deletePost: "choise/deletePost", */
    }),
    /*
    nice() {
      const postData = {
        user: this.loginUser.id,
        post: this.post.id,
      }
      if (this.like) {
        this.unLikePost(postData).then(() => {
          this.like = false
        })
      } else {
        this.likePost(postData).then(() => {
          console.log(this.like)
          this.like = true
        })
      }
    }, */
    pagelink(link) {
      this.$router.push({ path: link })
    },
    /*
    addMenu(f) {
      this.addPost(f)
      this.add = true
    }, */
    /*
    deleteMenu(f) {
      this.deletePost(f)
      this.add = false
    }, */
  },
}
</script>
