export const state = () => ({
  status: false,
  message: '',
  post: {},
  posts: [],
  start_time: 0,
  finish_time: 0,
})

export const getters = {
  status: (state) => state.status,
  message: (state) => state.message,
  post: (state) => state.post,
  posts: (state) => state.posts,
  start_time: (state) => state.start_time,
  finish_time: (state) => state.finish_time,
}

export const mutations = {
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
      console.log('Success')
    })
  },
  setStartTime(state, payload) {
    state.start_time = payload
  },
  setFinishTime(state, payload) {
    state.finish_time = payload.toFixed(1)
  },
  setStatus(state, bool) {
    state.status = bool
  },
  setMessage(state, message) {
    state.message = message
  },
}

export const actions = {
  showPostMessage({ commit }, { message, status }) {
    commit('setStatus', status)
    commit('setMessage', message)
    setTimeout(() => {
      commit('setStatus', !status)
    }, 1000)
  },
}
