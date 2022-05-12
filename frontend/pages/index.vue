<template>
  <div>
    <!-- おそらくECSフェーズでAPI key登録が必要になる -->
    <!-- https://qiita.com/ririson_jp/items/2fa5b60adc8e5f3edbbd#%E3%83%AA%E3%83%B3%E3%82%AF%E5%85%88%E9%83%BD%E9%81%93%E5%BA%9C%E7%9C%8C%E3%81%AE%E8%A9%B3%E7%B4%B0%E3%83%9A%E3%83%BC%E3%82%B8%E3%82%92%E3%81%A4%E3%81%8F%E3%82%8B -->
    <!-- <p>今日のmain.humidityは{{ weather }}です。</p> -->
    <!-- <p>今日の天気は{{ weather2 }}です。</p> -->
    <!-- <v-img :src="icon" height="125"></v-img> -->
    <hr />
    <!-- <v-btn depressed rounded text @click="logout"> ログアウト </v-btn> -->
    <!-- <v-btn depressed rounded text @click="initData"> initData </v-btn> -->
    <!-- <userMenuList /> -->
    <hr />
    <!-- <userMenu /> -->
    <!-- <Checkbox /> -->
    <!-- <SearchPost2 /> -->
    <!-- <WeatherCard /> -->
    <Schedule-card />
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
/* import Checkbox from "~/components/sort/Checkbox.vue" */
/* import SearchPost2 from "~/components/search/SearchPost2.vue" */
import ScheduleCard from '~/components/ScheduleCard.vue'
/* import WeatherCard from "~/components/WeatherCard.vue" */
import PostCreate from '~/components/admin/PostCreate.vue'
import userIdSetting from '~/components/editUser/UserIdSetting.vue'

export default {
  /*
    async asyncData({ $axios }) {
    const weatherData = await $axios.$get(
      'https://api.openweathermap.org/data/2.5/weather?q=tokyo,jp&APPID=' +
        process.env.WEATHER_API_KEY
    )
    return {
      weather: weatherData.main.humidity,
      weather2: weatherData.weather[0].main,
      icon: 'http://openweathermap.org/img/w/'+weatherData.weather[0].icon+'.png'
    }
  }, */
  data() {
    return {}
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
    }),
    postUpdate() {
      return this.$store.state.post.post
    },
  },
  components: {
    /*     Checkbox, */
    PostCreate,
    ScheduleCard,
    /*     WeatherCard, */
    userIdSetting,
    /*     SearchPost2, */
    /*     userMenuList, */
    /*     userMenu, */
  },
  methods: {},
}
</script>

<style scoped>
div {
  border: 5px solid yellow;
}
</style>
