<template>
  <div>
    <!-- https://api.openweathermap.org/data/2.5/onecall?lat=35.681236&lon=139.767125&units=metric&lang=ja&appid=442bcabd8060597b1152eeff08fd57d7 -->
    <p>今日の天気は{{ weather }}で、気温は{{ temp }}度です。</p>
    <button v-on:click="getData()">今日の東京の天気をAPIで取得！</button>

    <p>
      <a href="https://openweathermap.org/api"
        >openweathermapから取得しています。</a
      >
    </p>
    <hr />

    <div v-if="login">
      <user-id-setting />
    </div>

    <hr />

    <!-- おそらくECSフェーズでAPI key登録が必要になる -->
    <!-- https://qiita.com/ririson_jp/items/2fa5b60adc8e5f3edbbd#%E3%83%AA%E3%83%B3%E3%82%AF%E5%85%88%E9%83%BD%E9%81%93%E5%BA%9C%E7%9C%8C%E3%81%AE%E8%A9%B3%E7%B4%B0%E3%83%9A%E3%83%BC%E3%82%B8%E3%82%92%E3%81%A4%E3%81%8F%E3%82%8B -->
    <h1>日本全国の天気</h1>
    <ul>
      <li><nuxt-link :to="`city/tokyo`">東京</nuxt-link></li>
      <li><nuxt-link :to="`city/osaka`">大阪</nuxt-link></li>
      <li><nuxt-link :to="`city/fukuoka`">福岡</nuxt-link></li>
    </ul>

    <v-btn depressed rounded text @click="logout"> ログアウト </v-btn>
    <!-- <v-btn depressed rounded text @click="initData"> initData </v-btn> -->
    <!-- <userMenuList /> -->
    <hr />
    <!-- <userMenu /> -->
    <!-- <Checkbox /> -->
    <!-- <SearchPost2 /> -->
    <!-- <ScheduleCard />
    <WeatherCard /> -->
    <p>index</p>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
/* import Checkbox from "~/components/sort/Checkbox.vue" */
/* import SearchPost2 from "~/components/search/SearchPost2.vue" */
// import ScheduleCard from "~/components/ScheduleCard.vue"
// import WeatherCard from "~/components/WeatherCard.vue"
// import PostCreate from "~/components/admin/PostCreate.vue"
// import userIdSetting from "~/components/editUser/UserIdSetting.vue"
export default {
  data() {
    return {
      weather: 'xxxx',
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
    // PostCreate,
    // ScheduleCard,
    // WeatherCard,
    // userIdSetting,
    /*     SearchPost2, */
    /*     userMenuList, */
    /*     userMenu, */
  },
  methods: {
    getData: async function() {
      const URL = `https://api.openweathermap.org/data/2.5/weather?id=1850147&units=metric&appid=${process.env.WEATHER_API_KEY}`

      // const response = await axios.get(URL)
      // this.weather = response.data.weather[0].main
      // this.temp = response.data.main.temp
      // console.log(response.data);
    },
    ...mapActions({
      logout: 'auth/logout',
      initData: 'user/initData',
    }),
    async getSomething() {
      // タスク一覧を取得するための API を叩く
      const response = await this.$axios.$get('api/v1/users')
      this.users = JSON.parse(response.users)
    },
  },
}
</script>

<style scoped>
div {
  border: 5px solid yellow;
}
</style>
