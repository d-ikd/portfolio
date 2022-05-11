<template>
  <div class="mx-6">
    <v-row no-gutters class="mt-10 ml-10 mb-2 tab" @click="pagelink(links.to)">
      <h3 class="font-weight-bold headline ml-6">全体ランキング</h3>
      <v-icon right> mdi-chevron-right </v-icon>
    </v-row>
    <v-sheet max-width="100%" class="mx-10" style="background-color: #fbfbfb">
      <swiper :options="swiperOption" class="mx-6">
        <swiper-slide>
          <post-slide-group :posts="posts1" :number="a" />
        </swiper-slide>
        <swiper-slide>
          <post-slide-group :posts="posts2" :number="b" />
        </swiper-slide>
        <swiper-slide>
          <post-slide-group :posts="posts3" :number="c" />
        </swiper-slide>
        <swiper-slide>
          <post-slide-group :posts="posts4" :number="d" />
        </swiper-slide>
        <swiper-slide class="mb-13">
          <post-slide-group :posts="posts5" :number="e" />
        </swiper-slide>
        <div slot="pagination" class="swiper-pagination"></div>
        <div slot="button-prev" class="swiper-button-prev"></div>
        <div slot="button-next" class="swiper-button-next"></div>
      </swiper>
    </v-sheet>
  </div>
</template>

<script>
import postSlideGroup from '~/components/infoPost/PostSlideGroup.vue'

export default {
  components: {
    postSlideGroup,
  },
  layout: 'default',
  props: {
    posts: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      posts1: [],
      posts2: [],
      posts3: [],
      posts4: [],
      posts5: [],
      a: 1,
      b: 11,
      c: 21,
      d: 31,
      e: 41,
      links: {
        to: '/ranking',
      },
      swiperOption: {
        slidesPerView: 2,
        slidesPerGroup: 2,
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      },
    }
  },
  created() {
    this.posts1 = this.posts.slice(0, 10)
    this.posts2 = this.posts.slice(10, 20)
    this.posts3 = this.posts.slice(20, 30)
    this.posts4 = this.posts.slice(30, 40)
    this.posts5 = this.posts.slice(40, 50)
  },
  methods: {
    pagelink(link) {
      this.$store.dispatch('tab/getRankingTab', 0)
      this.$router.push({ path: link })
    },
  },
}
</script>

<style>
.tab {
  cursor: pointer;
}
.list-item {
  width: 100px;
}
</style>
