<template>
  <div>
    <section id="city-lists" class="section">
      <div class="container">
        <ul>
          <li>天気：{{ item.weather[0].main }}</li>
          <li>
            <img
              :src="
                'https://openweathermap.org/img/w/' +
                  item.weather[0].icon +
                  '.png'
              "
            />
          </li>
          <li>温度：{{ item.main.temp }}℃</li>
          <li>湿度：{{ item.main.humidity }}％</li>
          <li>風速：{{ item.wind.speed }}m</li>
        </ul>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  async asyncData({ route, app, error }) {
    try {
      const item = await app.$axios.$get(
        `https://api.openweathermap.org/data/2.5/weather?q=${route.params.name},jp&units=metric&lang=ja&appid=442bcabd8060597b1152eeff08fd57d7`
      )
      return {
        item,
      }
    } catch (err) {
      error({
        statusCode: err.response.status,
        message: err.response.data.message,
      })
    }
  },
}
</script>

<style scoped></style>
