<template>
  <v-container>
    <v-row justify="center">
      <v-col xl="7" lg="9" sm="11" cols="12">
        <v-card class="mx-auto">
          <v-card-text class="mt-7 display-3 font-weight-black text-center">
            私たちとは？
          </v-card-text>

          <v-col cols="12">
            <h3 class="mt-7 text-center">
              〇〇をよく利用する方の為の
            </h3>
            <h3 class="mt-3 text-center">
              〇〇レビュー＆ヘルスケアアプリです。
            </h3>
            <h4 class="mt-16 text-center">
              基本機能はログイン無しで閲覧可能ですのでお気軽にご覧下さい。
            </h4>
          </v-col>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  methods: {
    async getSomething() {
      const response = await this.$axios.$get(
        'http://localhost:5000/api/v1/tasks'
      )
      this.tasks = JSON.parse(response.tasks)
    },
  },
}
</script>
