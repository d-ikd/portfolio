<template>
  <v-card class="ml-8 mr-8 mt-4 rounded">
    <v-card class="mx-auto green lighten-3" dark max-width="400">
      <v-card-title>
        <v-menu transition="scroll-x-transition">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="white"
              class="ma-2"
              v-bind="attrs"
              outlined
              icon
              v-on="on"
            >
              <v-icon>mdi-magnify</v-icon>
            </v-btn>
          </template>
          <v-avatar size="500" class="radius-image">
            <v-img
              v-if="message.image.url"
              :src="message.image.url"
              alt="avatar"
            />
            <v-img v-else :src="defaultImage" contain />
          </v-avatar>
        </v-menu>
        <span class="headline font-weight-bold">{{ message.title }}</span>
      </v-card-title>

      <v-card-text class="title font-weight-light">
        <v-row>
          <v-col cols="9">
            {{ message.content }}
          </v-col>
          <v-col cols="3">
            <template v-if="message.image.url">
              <v-avatar size="80" class="radius-image mt-3 mb-3">
                <v-img
                  v-if="message.image.url"
                  :src="message.image.url"
                  alt="avatar"
                />
                <v-img v-else :src="defaultImage" contain />
              </v-avatar>
            </template>
          </v-col>
        </v-row>
      </v-card-text>

      <v-card-actions>
        <v-list-item class="grow">
          <v-list-item-avatar color="grey darken-3">
            <nuxt-link :to="{ path: `/users/${message.user_id}` }">
              <user-avatar
                :size="50"
                :user="message.user"
                class="elevation-6"
              />
            </nuxt-link>
          </v-list-item-avatar>

          <v-list-item-content>
            {{ message.user.name }}
          </v-list-item-content>
          <the-modal-message-edit :review="message" />
          <the-modal-message-delete :review="message" />

          <v-row align="center" justify="end">
            <v-icon class="mr-1">
              mdi-timelapse
            </v-icon>
            <span class="subheading">
              {{ $dayjs(message.created_at).format('MM/DD') }}&nbsp;{{
                $dayjs(message.created_at).format('hh:mm')
              }}</span
            >
          </v-row>
        </v-list-item>
      </v-card-actions>
      <template v-if="message.user_id === $store.state.auth.loginUser.id">
      </template>
    </v-card>
  </v-card>
</template>

<script>
import { mapGetters } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import theModalMessageEdit from '~/components/layouts/TheModalMessageEdit.vue'
import theModalMessageDelete from '~/components/layouts/TheModalMessageDelete.vue'

export default {
  components: {
    userAvatar,
    theModalMessageEdit,
    theModalMessageDelete,
  },
  props: {
    message: {
      type: Object,
      default: () => ({}),
      required: true,
    },
  },
  data() {
    return {
      createDate: '',
      expand: false,
      like: false,
    }
  },
  computed: {
    ...mapGetters({
      loginUser: 'auth/loginUser',
      login: 'auth/isLoggedIn',
    }),
    loginUserReview() {
      return this.$store.state.post.post
    },
  },
}
</script>

<style scoped>
.radius-image {
  border: 0px solid;
  border-radius: 20px;
}
.radius-big-image {
  border: 1px solid rgba(0, 0, 0.8);
  border-radius: 20px;
  border-color: #bdbdbd;
}
</style>
