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
        commit('snackbarMessage/setMessage', '気になるに追加しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        console.log(rootState.auth.currentUser.id)
        this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('Success')
          })
      })
      .catch((err) => {
        commit('snackbarMessage/setMessage', '追加に失敗しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
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
        console.log('Successfully unfollow')
        commit('snackbarMessage/setMessage', '「気になる」から外しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'info', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('Success')
          })
      })
      .catch((err) => {
        commit(
          'snackbarMessage/setMessage',
          '「気になる」から外せませんでした。',
          {
            root: true,
          }
        )
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async joinPost({ commit, rootState }, authData) {
    await this.$axios
      .$post('/api/v1/post_joins', {
        user_id: authData.user,
        post_id: authData.post,
      })
      .then(() => {
        commit('snackbarMessage/setMessage', '「参加します」に追加しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        console.log(rootState.auth.currentUser.id)
        this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('Success')
          })
      })
      .catch((err) => {
        commit(
          'snackbarMessage/setMessage',
          '「参加します」の追加に失敗しました。',
          {
            root: true,
          }
        )
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async unJoinPost({ rootState, commit }, authData) {
    await this.$axios
      .$delete('/api/v1/post_joins', {
        params: {
          user_id: authData.user,
          post_id: authData.post,
        },
      })
      .then(() => {
        console.log('Successfully unjoin')
        commit('snackbarMessage/setMessage', '「参加します」から外しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'info', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('Success')
          })
      })
      .catch((err) => {
        commit(
          'snackbarMessage/setMessage',
          '「参加します」から外せませんでした。',
          {
            root: true,
          }
        )
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
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
        commit('snackbarMessage/setMessage', 'メッセージを投稿しました', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('Successfully')
        })
      })
      .catch((err) => {
        commit(
          'snackbarMessage/setMessage',
          'メッセージの投稿に失敗しました。',
          {
            root: true,
          }
        )
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
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
        commit('snackbarMessage/setMessage', 'メッセージを更新しました', {
          root: true,
        })
        commit('snackbarMessage/setType', 'info', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('Success')
        })
      })
      .catch((err) => {
        commit(
          'snackbarMessage/setMessage',
          'メッセージの更新に失敗しました。',
          {
            root: true,
          }
        )
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
}
