<template>
  <v-card flat>
    <v-list>
      <!-- <v-list-item-group> -->
      <v-row>
        <v-list-item
          v-for="post in posts"
          :key="post.id"
          :ripple="false"
          class="list"
        >
          <v-list-item-avatar tile class="tab" @click="pagelink(post.id)">
            <v-img v-if="post.image.url" contain :src="post.image.url" />
            <v-img v-else contain :src="defaultImage" />
          </v-list-item-avatar>
          <v-list-item-title class="list-item" @click="pagelink(post.id)">
            {{ post.name }}
          </v-list-item-title>
          <schedule-card-info :post="post" />
        </v-list-item>
      </v-row>
      <!-- </v-list-item-group> -->
    </v-list>
  </v-card>
</template>

<script>
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'

export default {
  components: {
    scheduleCardInfo,
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
