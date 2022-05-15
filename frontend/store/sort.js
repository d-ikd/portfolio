export const mutations = {
  sortPosts({ commit }, { sort, posts }) {
    const result = []
    if (sort.outdoor) {
      posts.filter((value) => {
        if (value.category.includes('アウトドア')) {
          result.push(value)
        }
      })
    }
    if (sort.indoor) {
      posts.filter((value) => {
        if (value.category.includes('インドア')) {
          result.push(value)
        }
      })
    }
    if (!sort.outdoor && !sort.indoor) {
      posts.filter((value) => {
        result.push(value)
      })
    }
  },
}
