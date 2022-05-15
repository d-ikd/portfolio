<template>
  <div>
    <v-card v-for="post in posts" :key="post.id" class="mx-2 my-3">
      <div class="d-flex">
        <v-avatar size="40" class="ml-1" tile>
          <v-img :src="post.image.url" contain></v-img>
        </v-avatar>
        <nuxt-link :to="{ path: `/post/${post.id}` }">
          {{ post.name }}
        </nuxt-link>
        <v-spacer />

        <v-menu open-on-hover bottom offset-y>
          <template #activator="{ on, attrs }">
            <v-btn small color="primary" dark v-bind="attrs" v-on="on">
              Pickup
            </v-btn>
          </template>
          <v-list dense>
            <v-list-item link>
              <v-list-item-title
                v-if="post.pickups[0]"
                @click="unpickup(post.pickups[0].id)"
              >
                Pickup
              </v-list-item-title>
              <v-list-item-title v-else @click="pickup(post.id)">
                Unpickup
              </v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>

        <post-edit :post="post" />
        <v-btn
          small
          color="red darken-3 white--text"
          @click="deletePost(post.id)"
        >
          削除
        </v-btn>
      </div>

      <div class="caption">
        <span>予算:{{ post.price }}円</span>
        <span>開始時間:{{ post.start_time }}</span>
        <span>終了時間:{{ post.finish_time }}</span>
        <span>メンバー:{{ post.member }}人</span>
        <span>場所:{{ post.place }}</span>
        <span>投稿日:{{ post.release }}</span>
        <span>カテゴリ:{{ post.category }}</span>
      </div>
      <!-- <div class="caption">
        <span v-if="post.pickups[0]">Pickups</span>
      </div> -->
    </v-card>
  </div>
</template>

<script>
import postEdit from '~/components/admin/PostEdit.vue'

export default {
  components: {
    postEdit,
  },
  props: {
    posts: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {}
  },
  methods: {
    deletePost(id) {
      this.$axios
        .delete(`api/v1/posts/${id}`)
        .then((res) => {
          console.log(res.data)
          console.log('Success')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    pickup(id) {
      this.$axios
        .post('api/v1/pickups', {
          post_id: id,
        })
        .then((res) => {
          console.log(res.data)
          console.log('added in pickups')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    unpickup(id) {
      this.$axios
        .delete(`api/v1/pickups/${id}`)
        .then((res) => {
          console.log(res.data)
          console.log('Success')
        })
        .catch((err) => {
          console.log(err)
        })
    },
  },
}
</script>
