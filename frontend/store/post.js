export const state = () => ({
  post: {},
  posts: [],
})
export const getters = {
  post: (state) => state.post,
  posts: (state) => state.posts,
}
export const mutations = {
  setPosts(state, posts) {
    state.posts = posts.data
  },
  setPost(state, post) {
    state.post = post
  },
}

export const actions = {
  // setPost({ commit, rootState }, payload) {
  // },
  async getPosts({ commit }) {
    const posts = {
      data: '',
    }
    await this.$axios
      .get('api/v1/posts')
      .then((res) => {
        posts.data = res.data
        commit('setPosts', posts)
      })
      .catch((error) => {
        console.log(error)
      })
  },
  async likePost({ commit, rootState }, authData) {
    await this.$axios
      .$post('/api/v1/post_likes', {
        user_id: authData.user,
        post_id: authData.post,
      })
      .then(() => {
        commit('flashMessage/setMessage', '食べたいに追加しました。', {
          root: true,
        })
        commit('flashMessage/setType', 'success', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        console.log(rootState.auth.currentUser.id)
        this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('成功')
          })
      })
      .catch((err) => {
        commit('flashMessage/setMessage', '追加に失敗しました。', {
          root: true,
        })
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async unLikePost({ rootState, commit }, authData) {
    await this.$axios
      .$delete('/api/v1/post_likes', {
        params: {
          user_id: authData.user,
          post_id: authData.post,
        },
      })
      .then(() => {
        console.log('unfollow 成功')
        commit('flashMessage/setMessage', '食べたいから外しました。', {
          root: true,
        })
        commit('flashMessage/setType', 'info', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('成功')
          })
      })
      .catch((err) => {
        commit('flashMessage/setMessage', '食べたいから外せませんでした。', {
          root: true,
        })
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async review({ commit }, authData) {
    const form = new FormData()
    form.append('title', authData.title)
    form.append('content', authData.content)
    form.append('rate', authData.rate)
    form.append('user_id', authData.user_id)
    form.append('post_id', authData.post_id)
    if (authData.image !== null) {
      form.append('image', authData.image)
    }
    console.log(authData.image)
    await this.$axios
      .$post('/api/v1/reviews', form, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      })
      .then(() => {
        commit('flashMessage/setMessage', '口コミを投稿しました', {
          root: true,
        })
        commit('flashMessage/setType', 'success', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('成功')
        })
      })
      .catch((err) => {
        commit('flashMessage/setMessage', '口コミの投稿に失敗しました。', {
          root: true,
        })
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async editReview({ commit }, authData) {
    const form = new FormData()
    form.append('title', authData.title)
    form.append('content', authData.content)
    form.append('rate', authData.rate)
    form.append('user_id', authData.user_id)
    form.append('post_id', authData.post_id)
    if (authData.image !== null) {
      form.append('image', authData.image)
    }
    console.log(authData.image)
    await this.$axios
      .$put(`/api/v1/reviews/${authData.reviewId}`, form, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        params: {
          review_id: authData.reviewId,
        },
      })
      .then(() => {
        commit('flashMessage/setMessage', '口コミを更新しました', {
          root: true,
        })
        commit('flashMessage/setType', 'info', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('成功')
        })
      })
      .catch((err) => {
        commit('flashMessage/setMessage', '口コミの投稿に失敗しました。', {
          root: true,
        })
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
}
