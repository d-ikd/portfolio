<template>
  <v-tabs v-model="tab" align-with-title hide-slider>
    <v-tabs-slider />

    <v-tab
      v-for="item in items"
      :key="item.title"
      :to="item.to"
      @click="pagelink(item.to)"
    >
      <span class="font-weight-bold">{{ item.title }}</span>
    </v-tab>
  </v-tabs>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      tab: null,
      items: [
        {
          title: 'Edit',
          to: '/users/edit',
        },
        // {
        //   title: "ランキング",
        //   to: "/ranking",
        // },
        // {
        //   title: "カテゴリ",
        //   to: "/category",
        // },
        {
          title: '使い方',
          to: '/about',
        },
      ],
    }
  },
}
</script>
