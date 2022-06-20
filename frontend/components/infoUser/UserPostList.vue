<template>
  <v-list>
    <v-row>
      <v-list-item
        v-for="post in posts"
        :key="post.id"
        :ripple="false"
        class="list"
      >
        <v-list-item-avatar tile class="tab">
          <v-avatar size="40">
            <v-img v-if="post.image.url" :src="post.image.url" />
            <v-img v-else contain :src="defaultImage" />
          </v-avatar>
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title class="list-item title">
            {{ post.name }}
          </v-list-item-title>
        </v-list-item-content>

        <div class="d-flex align-center">
          <div class="ml-5 mt-6 mr-5">
            <info-dialog-component :post="post" />
          </div>
          <div>
            <button-like
              :user="loginUser"
              :post="post"
              :is-small-rounded-like="true"
            />
          </div>
        </div>
        <div></div>

        <!-- <v-list-item-title class="list-item" @click="pagelink(post.id)">
            {{ post.name }}
          </v-list-item-title>
          <schedule-card-info :post="post" /> -->
      </v-list-item>
    </v-row>
  </v-list>
</template>

<script>
import { mapGetters } from 'vuex'
import buttonLike from '~/components/layouts/ButtonLike.vue'
import infoDialogComponent from '~/components/infoUser/infoDialogComponent.vue'

export default {
  components: {
    buttonLike,
    infoDialogComponent,
  },
  props: {
    posts: {
      type: Array,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require('@/assets/images/default.png'),
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
    }),
  },
}
</script>

<style scoped>
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

.small-image {
  border: 1px solid;
  border-radius: 9px;
  border-color: #bdbdbd;
}
/* .small-image:hover {
  opacity: 0.7;
}
 */
</style>
