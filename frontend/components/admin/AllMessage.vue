<template>
  <div>
    <v-card v-for="message in messages" :key="message.id" class="mx-2 my-3">
      <div class="d-flex">
        <v-avatar size="30" class="ml-1" tile>
          <v-img :src="message.post.image.url" contain></v-img>
        </v-avatar>
        <nuxt-link :to="{ path: `/message/${message.post.id}` }">
          {{ message.post.name }}
        </nuxt-link>
      </div>
      <div classf="d-flex">
        <v-avatar size="30" class="ml-1">
          <v-img :src="message.user.image.url" conitain></v-img>
        </v-avatar>
        <nuxt-link :to="{ path: `/message/${message.user.id}` }">
          {{ message.user.name }}
        </nuxt-link>
      </div>
      <div classf="d-flex">
        {{ message.content }}
        <v-btn
          small
          color="red darken-3 white--text"
          @click="deleteMessage(message.id)"
        >
          削除
        </v-btn>
      </div>
    </v-card>
  </div>
</template>

<script>
export default {
  props: {
    messages: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {}
  },
  methods: {
    deleteMessage(id) {
      this.$axios
        .delete(`api/v1/messages/${id}`)
        .then((res) => {
          console.log(res.data)
          console.log('Successfully deleted')
        })
        .catch((err) => {
          console.log(err)
        })
    },
  },
}
</script>
