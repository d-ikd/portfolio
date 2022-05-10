export const state = () => ({
  loginModal: false,
  signUpModal: false,
})

export const getters = {
  loginModal: (state) => state.loginModal,
  signUpModal: (state) => state.signUpModal,
}

export const mutations = {
  clickLoginModal(state, bool) {
    state.loginModal = bool
  },
  clickSignUpModal(state, bool) {
    state.signUpModal = bool
  },
}

export const actions = {
  async loginUser({ commit }, bool) {
    commit('clickLoginModal', bool)
  },
  async signUpUser({ commit }, bool) {
    commit('clickSignUpModal', bool)
  },
}

// ========== To reset "loginModal" =========
// const initialState = {
//   // 通常stateに記載する値を記載
//   loginModal: false,
// }

// export const state = () => Object.assign({}, JSON.parse(JSON.stringify(initialState)))

// export const getters = {
//   loginModal: (state) => state.loginModal,
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
// ========== end of To reset "loginModal" ==========
