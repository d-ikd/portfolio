<template>
  <div>
    <v-card class="mx-auto green lighten-3 mt-8" dark max-width="400">
      <v-row>
        <v-col cols="8">
          <v-card-title>
            <span class="headline font-weight-bold">{{ message.title }}</span>

            <v-spacer />
          </v-card-title>
          <v-card-text class="title font-weight-light">
            {{ message.content }}
          </v-card-text>
        </v-col>
        <v-col cols="4">
          <template v-if="message.image.url">
            <v-menu transition="scroll-x-transition">
              <template v-slot:activator="{ on, attrs }">
                <v-img
                  v-if="message.image.url"
                  :src="message.image.url"
                  alt="avatar"
                  :aspect-ratio="1 / 1"
                  class="rounded-card mr-4 mt-4"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi-magnify</v-icon>
                </v-img>
                <v-img v-else :src="defaultImage" contain />
              </template>
              <v-avatar size="500" class="radius-image2">
                <v-img
                  v-if="message.image.url"
                  :src="message.image.url"
                  alt="avatar"
                />
              </v-avatar>
            </v-menu>
          </template>
        </v-col>
      </v-row>
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
          <the-modal-message-edit :message="message" />
          <the-modal-message-delete :message="message" />

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
  </div>
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
.radius-image2 {
  border: 0px solid;
  border-radius: 20px;
}
.radius-big-image {
  border: 1px solid rgba(0, 0, 0.8);
  border-radius: 20px;
  border-color: #bdbdbd;
}
</style>
