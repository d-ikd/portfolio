<template>
  <div>
    <!--    <button v-on:click="showMessage">ボタン</button> -->

    <!-- おそらくECSフェーズでAPI key登録が必要になる -->
    <!-- https://qiita.com/ririson_jp/items/2fa5b60adc8e5f3edbbd#%E3%83%AA%E3%83%B3%E3%82%AF%E5%85%88%E9%83%BD%E9%81%93%E5%BA%9C%E7%9C%8C%E3%81%AE%E8%A9%B3%E7%B4%B0%E3%83%9A%E3%83%BC%E3%82%B8%E3%82%92%E3%81%A4%E3%81%8F%E3%82%8B -->
    <!-- <p>今日の天気は{{ weatherData }}です。</p> -->
    <v-btn @click="asyncData">今日の東京の天気をAPIで取得！</v-btn>
    <p>
      <a href="https://openweathermap.org/api"
        >openweathermapから取得しています。</a
      >
    </p>

    <hr />

    <!-- <v-btn depressed rounded text @click="logout"> ログアウト </v-btn> -->
    <!-- <v-btn depressed rounded text @click="initData"> initData </v-btn> -->
    <!-- <userMenuList /> -->
    <hr />
    <!-- <userMenu /> -->
    <!-- <Checkbox /> -->
    <!-- <SearchPost2 /> -->
    <ScheduleCard />
    <WeatherCard />
    <p>index</p>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
/* import Checkbox from "~/components/sort/Checkbox.vue" */
/* import SearchPost2 from "~/components/search/SearchPost2.vue" */
import ScheduleCard from '~/components/ScheduleCard.vue'
import WeatherCard from '~/components/WeatherCard.vue'
import PostCreate from '~/components/admin/PostCreate.vue'
import userIdSetting from '~/components/editUser/UserIdSetting.vue'

export default {
  /*     async asyncData({ $axios }) {
    const weatherData = await $axios.$get(
      'https://api.openweathermap.org/data/2.5/weather?q=saitama,jp&APPID=' +
        process.env.WEATHER_API_KEY
    )
    return {
      weather: weatherData.weather[0].main
    }
  },*/

  data() {
    return {
      temp: 'yyyy',
      number: 18,
    }
  },
  computed: {
    ...mapGetters({
      user: 'user/user',
      loginUser: 'auth/loginUser',
    }),
  },
  components: {
    /*     Checkbox, */
    PostCreate,
    ScheduleCard,
    WeatherCard,
    userIdSetting,
    /*     SearchPost2, */
    /*     userMenuList, */
    /*     userMenu, */
  },
  methods: {
    showMessage() {
      const response = this.$axios
        .$get('/api')
        .then((response) => {
          console.log(response)
        })
        .catch((error) => {
          console.log(error)
        })
    },
    async asyncData() {
      const weatherData = await this.$axios
        .$get(
          'https://api.openweathermap.org/data/2.5/weather?q=saitama,jp&APPID=' +
            process.env.WEATHER_API_KEY
        )
        .then((weatherData) => {
          console.log(weatherData)
        })
        .catch((error) => {
          console.log(error)
        })
    },
    /* async getData() {
          const URL = `https://api.openweathermap.org/data/2.5/weather?q=tokyo&APPID=${process.env.WEATHER_API_KEY}`
          const response = await this.$axios.get(URL);
          const data =await response.json();
          console.log(data); */
    /* return {
        response
      } */
  },
}
</script>

<style scoped>
div {
  border: 5px solid yellow;
}
</style>
