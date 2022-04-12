<template>
  <div>
    <p>test</p>
  </div>
</template>

<script>
import grid from '~/components/grid.vue'
import parallax from '~/components/parallax.vue'
import parallax2 from '~/components/parallax2.vue'
import textfield from '~/components/textfield.vue'
import calendar from '~/components/calendar.vue'
import weather from '~/components/weather.vue'
import carousel from '~/components/carousel.vue'
import rating from '~/components/rating.vue'
export default {
  components: {
    grid,
    parallax,
    parallax2,
    textfield,
    calendar,
    weather,
    carousel,
    rating,
  },

  methods: {
    async getSomething() {
      const response = await this.$axios.$get('api/v1/tasks')
      this.tasks = JSON.parse(response.tasks)
    },
  },
}
</script>

<style scoped>
/*
*{
margin: 0;
}
*/
.fadeIn {
  animation-name: fadeInAnime; /*1で解説*/
  animation-fill-mode: backwards; /*2で解説*/
  animation-duration: 3s; /*3で解説*/
  animation-iteration-count: 1; /*4で解説*/
  animation-timing-function: ease; /*5で解説*/
  animation-delay: 0.5s; /*6で解説*/
  animation-direction: normal; /*7で解説*/
}
/*1で解説*/
@keyframes fadeInAnime {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
/* https://coco-factory.jp/ugokuweb/css02/ */
</style>
