<template>
  <div style="height: 4000px">
    <h1>Hello.Vue</h1>
    <p>{{ $store.state.user.current_user }}</p>
  </div>
</template>

<script>
export default {
  auth: false,
  layout: 'default',
  // data() {},
  // methods: {
  //   async getSomething() {
  //     const response = await this.$axios.$get('api/v1/tasks')
  //     this.tasks = JSON.parse(response.tasks)
  //   },
  // },
}
</script>

<style>
h1 {
  font-family: 'Fraunces', serif;
}
</style>
