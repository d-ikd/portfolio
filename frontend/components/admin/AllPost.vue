<template>
  <div>
    <p>test</p>
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
              トピック
            </v-btn>
          </template>

          <v-list dense>
            <v-list-item link>
              <v-list-item-title
                v-if="post.recommends[0]"
                @click="noRecommend(post.recommends[0].id)"
              >
                おすすめから解除
              </v-list-item-title>
              <v-list-item-title v-else @click="recommend(post.id)">
                おすすめに追加
              </v-list-item-title>
            </v-list-item>

            <v-list-item link>
              <v-list-item-title
                v-if="post.pickups[0]"
                @click="noWinter(post.pickups[0].id)"
              >
                冬のおすすめから解除
              </v-list-item-title>
              <v-list-item-title v-else @click="winter(post.id)">
                冬のおすすめに追加
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
        <span>価格:{{ post.price }}円</span>
        <span>カロリー:{{ post.calorie }}kcl</span>
        <span>炭水化物:{{ post.carbonhydrate }}g</span>
        <span>タンパク質:{{ post.protein }}g</span>
        <span>脂質:{{ post.lipid }}g</span>
        <span>発売日:{{ post.release }}</span>
        <span>カテゴリ:{{ post.category }}</span>
        <span>ブランド:{{ post.maker }}</span>
      </div>
      <div class="caption">
        トピック:
        <span v-if="post.recommends[0]">おすすめ</span>
        <span v-if="post.pickups[0]">冬のおすすめ</span>
      </div>
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
          console.log('フード削除')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    winter(id) {
      this.$axios
        .post('api/v1/pickups', {
          post_id: id,
        })
        .then((res) => {
          console.log(res.data)
          console.log('冬のおすすめ追加')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    recommend(id) {
      this.$axios
        .post('api/v1/recommends', {
          post_id: id,
        })
        .then((res) => {
          console.log(res.data)
          console.log('おすすめ追加')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    noWinter(id) {
      this.$axios
        .delete(`api/v1/pickups/${id}`)
        .then((res) => {
          console.log(res.data)
          console.log('冬のおすすめから削除')
        })
        .catch((err) => {
          console.log(err)
        })
    },
    noRecommend(id) {
      this.$axios
        .delete(`api/v1/recommends/${id}`)
        .then((res) => {
          console.log(res.data)
          console.log('おすすめから削除')
        })
        .catch((err) => {
          console.log(err)
        })
    },
  },
}
</script>
