export const state = () => ({
  search: '投稿',
})

export const getters = {
  search: (state) => state.search,
}

export const mutations = {
  setSearch(state, payload) {
    state.search = payload
  },
}

export const actions = {
  getSearch({ commit }, payload) {
    commit('setSearch', payload)
  },
}

// const initialState = {
//   // 通常stateに記載する値を記載
//   search: '投稿',
// }

// export const state = () => Object.assign({}, JSON.parse(JSON.stringify(initialState)))

// export const getters = {
//   user: (state) => state.user,
// }

// export const mutations = {
//   INIT_DATA(state) {
//     Object.assign(state, JSON.parse(JSON.stringify(initialState)))
//   }
// }

// export const actions = {
//   initData({ commit }) {
//     commit('INIT_DATA')
//   }
// }
