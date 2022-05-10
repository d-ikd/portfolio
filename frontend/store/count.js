export const state = () => ({
  counter: 1,
})

export const getters = {
  counter: (state) => state.counter,
}

export const mutations = {
  countUp(state, number) {
    state.counter += number
  },
}

export const actions = {
  countAction({ commit }, number) {
    commit('countUp', number)
    commit('flashMessage/setMessage', 'ログアウトしました。', { root: true })
    commit('flashMessage/setType', 'success', { root: true })
    commit('flashMessage/setStatus', true, { root: true })
    setTimeout(() => {
      commit('flashMessage/setStatus', false, { root: true })
    }, 1000)
  },
}
