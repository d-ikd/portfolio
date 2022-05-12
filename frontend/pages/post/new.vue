<template>
  <v-container>
    <h1 class="mt-7">新発売</h1>
    <v-row class="mt-3">
      <v-col sm="3" cols="12">
        <v-card>
          <v-tabs v-model="tab" vertical>
            <v-tab v-for="(item, i) in items" :key="i">
              <span class="font-weight-bold">{{ item.title }}</span>
            </v-tab>
          </v-tabs>
        </v-card>
      </v-col>
      <v-col sm="9" cols="12">
        <v-tabs-items v-model="tab">
          <v-tab-item>
            <v-card class="pa-3">
              <new-post-list
                v-if="loading"
                :posts="newPosts"
                :cate="category"
              />
            </v-card>
          </v-tab-item>
          <v-tab-item>
            <v-card class="pa-3">
              <new-post-list :posts="newPlanPosts" :cate="category" />
            </v-card>
          </v-tab-item>
        </v-tabs-items>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// import newPostList from "~/components/newPost/NewPostList.vue"
// import checkbox from "~/components/sort/Checkbox.vue"
export default {
  components: {
    // newPostList,
    // checkbox,
  },
  data() {
    return {
      newPosts: [],
      newPlanPosts: [],
      loading: false,
      items: [{ title: '発売中' }, { title: '発売予定' }],
      category: [],
    }
  },
  computed: {
    tab: {
      get() {
        return this.$store.state.tab.newTab
      },
      set(val) {
        this.$store.dispatch('tab/getNewTab', val)
      },
    },
  },
  created() {
    this.$axios.get('api/v1/new_plan_post').then((res) => {
      console.log(res.data)
      this.newPlanPosts = res.data
    })
    this.$axios.get('api/v1/new_post').then((res) => {
      console.log(res.data)
      this.newPosts = res.data
      this.loading = true
    })
  },
  methods: {
    catchCategory(category) {
      this.category = category
    },
  },
}
</script>
