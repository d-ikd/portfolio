export const mutations = {
  sortPosts({ commit }, { sort, posts }) {
    const result = []
    if (sort.outdoor) {
      posts.filter((value) => {
        if (value.category.indexOf('アウトドア') !== -1) {
          result.push(value)
        }
      })
    }
    if (sort.indoor) {
      posts.filter((value) => {
        if (value.category.indexOf('インドア') !== -1) {
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
