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
