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

/* eslint-disable */
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
        commit('flashMessage/setMessage', '気になるに追加しました。', {
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
            console.log('Success')
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
        console.log('Successfully unfollow')
        commit('flashMessage/setMessage', '「気になる」から外しました。', {
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
            console.log('Success')
          })
      })
      .catch((err) => {
        commit(
          'flashMessage/setMessage',
          '「気になる」から外せませんでした。',
          {
            root: true,
          }
        )
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
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
        commit('flashMessage/setMessage', '「参加します」に追加しました。', {
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
            console.log('Success')
          })
      })
      .catch((err) => {
        commit(
          'flashMessage/setMessage',
          '「参加します」の追加に失敗しました。',
          {
            root: true,
          }
        )
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
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
        commit('flashMessage/setMessage', '「参加します」から外しました。', {
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
            console.log('Success')
          })
      })
      .catch((err) => {
        commit(
          'flashMessage/setMessage',
          '「参加します」から外せませんでした。',
          {
            root: true,
          }
        )
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async message({ commit }, authData) {
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
      .$post('/api/v1/messages', form, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      })
      .then(() => {
        commit('flashMessage/setMessage', 'メッセージを投稿しました', {
          root: true,
        })
        commit('flashMessage/setType', 'success', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('Successfully')
        })
      })
      .catch((err) => {
        commit(
          'flashMessage/setMessage',
          'メッセージの投稿に失敗しました。',
          {
            root: true,
          }
        )
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async editMessage({ commit }, authData) {
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
      .$put(`/api/v1/messages/${authData.messageId}`, form, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
        params: {
          message_id: authData.messageId,
        },
      })
      .then(() => {
        commit('flashMessage/setMessage', 'メッセージを更新しました', {
          root: true,
        })
        commit('flashMessage/setType', 'info', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('Success')
        })
      })
      .catch((err) => {
        commit(
          'flashMessage/setMessage',
          'メッセージの更新に失敗しました。',
          {
            root: true,
          }
        )
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async photoPost({ commit }, authData) {
    const form = new FormData()
    form.append('user_id', authData.user_id)
    form.append('post_id', authData.post_id)
    if (authData.image !== null) {
      form.append('image', authData.image)
    }
    console.log(authData.image)
    await this.$axios
      .$post('/api/v1/post_photos', form, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      })
      .then(() => {
        commit('flashMessage/setMessage', 'メッセージを投稿しました', {
          root: true,
        })
        commit('flashMessage/setType', 'success', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
        this.$axios.$get(`/api/v1/posts/${authData.post_id}`).then((res) => {
          commit('setPost', res)
          console.log('Successfully')
        })
      })
      .catch((err) => {
        commit(
          'flashMessage/setMessage',
          'メッセージの投稿に失敗しました。',
          {
            root: true,
          }
        )
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
}
/* eslint-disable */
