<template>
  <div>
    <template v-if="post.image.url">
      <v-avatar :size="size" class="post-image">
        <v-img :src="post.image.url" alt="avatar" />
      </v-avatar>
    </template>
    <template v-else>
      <v-avatar :size="size">
        <v-img :src="icon" alt="avatar" />
      </v-avatar>
    </template>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  props: {
    size: {
      type: Number,
      required: true,
    },
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      icon: require('@/assets/images/default-user.png'),
    }
  },
  computed: {
    ...mapGetters({
      post: 'post/post',
    }),
  },
}
</script>

<style scoped></style>
