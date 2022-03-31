<template>
  <div class="container">
    <div>
      <h1 class="title">
        shinki-app
      </h1>
      <h2 class="subtitle">
        {{ subTitle }}
      </h2>
      <button @click="getSomething">
        タスク取得
      </button>
      // 取得した tasks をリスト形式で表示する
      <ul v-for="task in tasks" :key="task.id">
        <li style="text-align: left;">{{ task.title }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      subTitle: 'Shinki-app is good service!!',
      tasks: [],
    }
  },
  methods: {
    async getSomething() {
      // タスク一覧を取得するための API を叩く
      const response = await this.$axios.$get('api/v1/tasks')
      this.tasks = JSON.parse(response.tasks)
    },
  },
}
</script>
