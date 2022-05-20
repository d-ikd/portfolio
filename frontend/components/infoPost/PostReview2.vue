<template>
  <v-card class="ml-8 mr-8 mt-4 green lighten-3 rounded">
    <v-card flat class="green lighten-3">
      <v-row no-gutters>
        <v-col cols="12" sm="12">
          <v-row>
            <v-col>
              <v-sheet class="green lighten-3 d-flex align-center ">
                <!-- <nuxt-link :to="{ path: `/users/${review.user_id}` }">
                  <user-avatar :size="50" :user="review.user" />
                </nuxt-link> -->

                {{ review.member }} が {{ createDate }} に投稿
              </v-sheet>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-card>

    <!-- ======== Rating & Title ========= -->
    <!-- <div class="ml-4 d-flex align-center">
      <v-rating
        v-model="rating"
        empty-icon="mdi-heart-outline"
        full-icon="mdi-heart"
        background-color="orange lighten-1"
        color="orange darken-2"
        readonly
        dense
        small
      />
    </div> -->
    <!-- ======== Rating & Title ========= -->
  </v-card>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import userAvatar from '~/components/infoUser/UserAvatar.vue'
import postReviewEdit from '~/components/infoPost/PostReviewEdit.vue'
import postReviewDelete from '~/components/infoPost/PostReviewDelete.vue'
import userDialogLike from '~/components/infoUser/UserDialogLike.vue'

export default {
  components: {
    userAvatar,
    postReviewEdit,
    postReviewDelete,
    userDialogLike,
  },
  props: {
    review: {
      type: Object,
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
}
</script>

<style scoped>
.radius-image {
  border: 1px solid;
  border-radius: 20px;
  border-color: #bdbdbd;
}
.radius-big-image {
  border: 1px solid rgba(0, 0, 0.8);
  border-radius: 20px;
  border-color: #bdbdbd;
}
.review-content {
  margin-bottom: 0px;
}
.arrow_box {
  position: relative;
  border: 1px solid black;
  padding: 5px 7px;
  color: #39c !important;
  text-decoration: underline !important;
  border-radius: 3px;
}
.arrow_box:after,
.arrow_box:before {
  right: 100%;
  top: 50%;
  border: solid transparent;
  content: '';
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}

.arrow_box:after {
  border-color: rgba(136, 183, 213, 0);
  border-right-color: white;
  border-width: 6px;
  margin-top: -6px;
}
.arrow_box:before {
  border-color: rgba(194, 225, 245, 0);
  border-right-color: black;
  border-width: 7px;
  margin-top: -7px;
}
</style>
