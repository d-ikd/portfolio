export const state = () => ({
  drawer: false,
  status: false,
  message: '',
  post: {},
  posts: [],
  start_time: 0,
  finish_time: 0,
  member: 0,
  place: 0,
  price: 0,
})

export const getters = {
  drawer: (state) => state.drawer,
  status: (state) => state.status,
  message: (state) => state.message,
  post: (state) => state.post,
  posts: (state) => state.posts,
  start_time: (state) => state.start_time,
  finish_time: (state) => state.finish_time,
  member: (state) => state.member,
  place: (state) => state.place,
  price: (state) => state.price,
}

export const mutations = {
  setDrawer(state, drawer) {
    state.drawer = drawer
  },
  setPosts(state, post) {
    state.post = post
    state.posts.push(post)
  },
  resetPosts(state, payload) {
    state.posts = payload
  },
  unsetPosts(state, post) {
    state.post = post
    state.post.some(function(v, i) {
      if (v.id == post.id) state.posts.splice(i, 1)
      console.log('削除成功')
    })
  },
  setStartTime(state, payload) {
    state.start_time = payload
  },
  setFinishTime(state, payload) {
    state.finish_time = payload.toFixed(1)
  },
  setMember(state, payload) {
    state.member = payload.toFixed(1)
  },
  setPlace(state, payload) {
    state.place = payload.toFixed(1)
  },
  setPrice(state, payload) {
    state.price = payload
  },
  setStatus(state, bool) {
    state.status = bool
  },
  setMessage(state, message) {
    state.message = message
  },
}

export const actions = {
  showDrawer({ commit }, payload) {
    commit('setDrawer', payload)
  },
  addPost({ state, commit, dispatch }, post) {
    commit('setPosts', post)
    let start_time = 0.0
    let finish_time = 0.0
    let member = 0.0
    let place = 0.0
    let price = 0.0
    state.posts.forEach((f) => {
      start_time += f.start_time
      finish_time += f.finish_time
      member += f.member
      place += f.place
      price += f.price
      console.log('終了')
    })
    console.log('代入')
    commit('setStartTime', start_time)
    commit('setFinishTime', finish_time)
    commit('setMember', member)
    commit('setPlace', place)
    commit('setPrice', price)
    dispatch('showPostMessage', {
      status: true,
      message: '一覧に追加しました。',
    })
    console.log('表示できました')
  },
  deletePost({ state, commit, dispatch }, post) {
    commit('unsetPosts', post)
    let start_time = 0.0
    let finish_time = 0.0
    let member = 0.0
    let place = 0.0
    let price = 0.0
    state.posts.forEach((f) => {
      start_time += f.start_time
      finish_time += f.finish_time
      member += f.member
      place += f.place
      price += f.price
      console.log('終了')
    })
    console.log('代入')
    commit('setStartTime', start_time)
    commit('setFinishTime', start_time)
    commit('setMember', member)
    commit('setPlace', place)
    commit('setPrice', price)
    dispatch('showPostMessage', {
      status: true,
      message: '一覧から削除しました。',
    })
    console.log('表示できました')
  },
  deleteChoise({ commit }) {
    commit('setStartTime', 0)
    commit('setFinishTime', 0)
    commit('setMember', 0.0)
    commit('setPlace', 0.0)
    commit('setPrice', 0)
    commit('resetPosts', [])
  },
  showPostMessage({ commit }, { message, status }) {
    commit('setStatus', status)
    commit('setMessage', message)
    setTimeout(() => {
      commit('setStatus', !status)
    }, 700)
  },
  async registerPosts(
    { commit, dispatch, rootState, state },
    { day, zone, number }
  ) {
    try {
      if (state.posts.length) {
        const res = await this.$axios.$post('/api/v1/menus', {
          user_id: rootState.auth.currentUser.id,
          date: day,
          timezone: zone,
          timezone_number: number,
        })
        console.log(res)
        await Promise.all(
          state.posts.map((post) => {
            this.$axios.post('api/v1/choise_posts', {
              post_id: post.id,
              menu_id: res.id,
            })
          })
        )
        await this.$axios
          .$get(`/api/v1/users/${rootState.auth.currentUser.id}`)
          .then((res) => {
            console.log(res)
            commit('auth/setLoginUser', res, { root: true })
            console.log('成功')
          })
        dispatch(
          'flashMessage/showMessage',
          {
            message: '献立を保存しました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
        dispatch('deleteChoise')
      } else {
        dispatch(
          'flashMessage/showMessage',
          {
            message: '献立を選択して下さい',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      }
    } catch (err) {
      console.log(err)
      dispatch(
        'flashMessage/showMessage',
        {
          message: '同じ日付・時間帯では1度しかセットできません',
          type: 'error',
          status: true,
        },
        { root: true }
      )
    }
  },
}
