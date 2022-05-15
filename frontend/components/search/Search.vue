<template>
  <div>
    <v-row>
      <v-col sm="3" cols="12">
        <template v-if="search == '投稿'">
          <!-- <checkbox @category="catchCategory" /> -->
        </template>
      </v-col>
      <v-col sm="6" cols="12">
        <v-text-field
          v-model="searchForm"
          solo
          label="検索ワード"
          prepend-inner-icon="mdi-magnify"
        />
      </v-col>
      <v-col sm="3" cols="12">
        <!--           <v-select v-model="search" :items="items" label="検索項目" /> -->
      </v-col>
    </v-row>
    <template v-if="search == '投稿' && resPosts.length">
      <schedule-card2 :posts="resPosts" />
    </template>
  </div>
</template>

<script>
import _debounce from 'lodash.debounce'
import searchPost from '~/components/search/SearchPost.vue'
import userList from '~/components/infoUser/UserList.vue'
import ScheduleCard2 from '~/components/search/ScheduleCard2.vue'
import checkbox from '~/components/search/Checkbox.vue'
import PostList from '~/components/infoPost/PostList.vue'

export default {
  components: {
    searchPost,
    ScheduleCard2,
    userList,
    PostList,
    checkbox,
  },
  data() {
    return {
      loading: false,
      items: ['投稿', 'ユーザー'],
      category: [],
      searchForm: '',
      resPosts: [],
      resUsers: [],
    }
  },
  computed: {
    search: {
      get() {
        return this.$store.state.tab.search
      },
      set(val) {
        this.$store.dispatch('tab/getSearch', val)
      },
    },
  },
  watch: {
    searchForm() {
      _debounce(this.resSearch, 500)()
    },
  },
  created() {
    // const debounce = require('lodash.debounce')
    // this.delayFunc = debounce(this.resSearch(), 500)
  },
  methods: {
    resSearch() {
      if (this.search == '投稿' && this.searchForm) {
        this.$axios
          .$get('api/v1/posts/search', {
            params: {
              search: this.searchForm,
            },
          })
          .then((res) => {
            this.resPosts = res
          })
          .catch((error) => {
            console.log(error)
          })
      } else if (this.search == 'ユーザー' && this.searchForm) {
        this.$axios
          .$get('api/v1/users/search', {
            params: {
              search: this.searchForm,
            },
          })
          .then((res) => {
            this.resUsers = res
          })
          .catch((error) => {
            console.log(error)
          })
      } else {
        this.resPosts = []
        this.resUsers = []
      }
    },
    catchCategory(category) {
      this.category = category
    },
  },
}
</script>
