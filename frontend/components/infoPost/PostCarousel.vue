<template>
  <div class="mx-5">
    <v-row no-gutters class="mt-4 ml-16 tab" @click="pagelink(title.link)">
      <h3 class="font-weight-bold headline">{{ title.text }}</h3>
      <v-icon right> mdi-chevron-right </v-icon>
    </v-row>
    <v-row class="mx-14">
      <swiper :options="swiperOption" class="pt-2">
        <swiper-slide v-for="post in posts" :key="post.id">
          <v-hover v-slot="{ hover }">
            <v-card
              class="ma-4 pb-2"
              width="188px"
              :to="{ path: `/post/${post.id}` }"
              :elevation="hover ? 12 : 2"
              :class="{ 'on-hover': hover }"
            >
              <div style="background-color: #eeeeee">
                <v-card-title
                  class="post-title caption text-center justify-center font-weight-bold"
                >
                  {{ post.name }}
                </v-card-title>
              </div>
              <v-layout class="justify-center mt-2">
                <v-img
                  v-if="post.image.url"
                  height="130px"
                  width="130px"
                  contain
                  :src="post.image.url"
                />
                <v-img
                  v-else
                  height="130px"
                  width="130px"
                  contain
                  :src="defaultImage"
                />
              </v-layout>
            </v-card>
          </v-hover>
        </swiper-slide>
        <div slot="button-prev" class="swiper-button-prev"></div>
        <div slot="button-next" class="swiper-button-next"></div>
      </swiper>
    </v-row>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  props: {
    posts: {
      type: Array,
      required: true,
    },
    title: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      defaultImage: require('@/assets/images/default.png'),
      swiperOption: {
        slidesPerView: 5,
        slidesPerGroup: 5,
        freeMode: true,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      },
    }
  },
  methods: {
    ...mapActions({ setTab: 'topic/getTab' }),
    pagelink(link) {
      if (link == '/post/new') {
        this.$store.dispatch('tab/getNewTab', 0)
      }
      this.$router.push({ path: link })
    },
  },
}
</script>

<style scoped>
.post-title {
  font-size: 17px;
  height: 60px;
  padding: 0px 5px 0px;
}
.tab {
  cursor: pointer;
}
</style>
