<template>
  <v-card flat>
    <v-list>
      <v-row>
        <v-list-item
          v-for="post in posts"
          :key="post.id"
          :ripple="false"
          class="list"
        >
          <v-list-item-avatar tile class="tab">
            <v-img v-if="post.image.url" contain :src="post.image.url" />
            <v-img v-else contain :src="defaultImage" />
          </v-list-item-avatar>

          <v-row>
            <v-col>
              {{ post.name }}
            </v-col>
            <v-col align-self="end">
              <dialog-component2 :post="post" class="mb-n1" />
            </v-col>
          </v-row>

          <!--           <v-list-item-title class="list-item" @click="pagelink(post.id)">
            {{ post.name }}
          </v-list-item-title>
          <schedule-card-info :post="post" /> -->
        </v-list-item>
      </v-row>
    </v-list>
  </v-card>
</template>

<script>
import scheduleCardInfo from '~/components/ScheduleCardInfo.vue'
import dialogComponent2 from '~/components/layouts/DialogComponent2.vue'

export default {
  components: {
    scheduleCardInfo,
    dialogComponent2,
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
}
</script>

<style scoped>
.tab {
  cursor: pointer;
}
/* .list-item {
  width: 100px;
  cursor: pointer;
} */
.list:hover {
  transition: 0.3s;
  background-color: #f5f5f5;
}
.list {
  cursor: default;
}
</style>
