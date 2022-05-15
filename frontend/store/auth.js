export const state = () => ({
  currentUser: null,
  loginUser: null,
  isLoggedIn: false,
  isAdmin: false,
})

export const getters = {
  currentUser: (state) => state.currentUser,
  loginUser: (state) => state.loginUser,
  isLoggedIn: (state) => state.isLoggedIn,
  isAdmin: (state) => state.isAdmin,
}

export const mutations = {
  setCurrentUser(state, user) {
    state.currentUser = user
  },
  setLoginUser(state, user) {
    state.loginUser = user
  },
  setIsLoggedIn(state, bool) {
    state.isLoggedIn = bool
  },
  setIsAdmin(state, bool) {
    state.isAdmin = bool
  },
}

export const actions = {
  async signUp({ commit, state }, authData) {
    const form = new FormData()
    form.append('name', authData.name)
    form.append('email', authData.email)
    form.append('password', authData.password)
    form.append('password_confirmation', authData.password_confirmation)
    // if (authData.image !== null) {
    //   form.append("image", authData.image)
    // }
    await this.$axios
      .post('/api/v1/auth/', form, {
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      })
      .then((res) => {
        console.log(res)
        commit('setCurrentUser', res.data.data)
        commit('snackbarMessage/setMessage', 'ユーザーを登録しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        commit('modal/clickSignUpModal', false, { root: true })
        this.$router.push('/')
        this.$axios
          .$get(`/api/v1/users/${state.currentUser.id}`)
          .then((res) => {
            console.log('loginUser')
            commit('setLoginUser', res)
            commit('setIsLoggedIn', true)
            console.log('Successfully signed up')
          })
        this.$router.push('/')
      })
      .catch((err) => {
        console.log(err)
        commit('snackbarMessage/setMessage', 'ユーザー登録に失敗しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
  async login({ commit, state }, authData) {
    await this.$axios
      .$post('/api/v1/auth/sign_in', {
        email: authData.email,
        password: authData.password,
      })
      .then((res) => {
        console.log(res.data)
        commit('setCurrentUser', res.data)
        commit('snackbarMessage/setMessage', 'ログインしました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        commit('modal/clickLoginModal', false, { root: true })
        this.$router.push('/')
        this.$axios
          .$get(`/api/v1/users/${state.currentUser.id}`)
          .then((res) => {
            console.log('loginUser')
            commit('setLoginUser', res)
            commit('setIsLoggedIn', true)
            console.log('Successfully logined')
            if (state.currentUser.admin) {
              commit('setIsAdmin', true)
              this.$router.push('admin')
            } else {
              this.$router.push('/')
            }
          })
        return res
      })
      .catch((err) => {
        commit('snackbarMessage/setMessage', 'ログインに失敗しました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        console.log(err)
        return err
      })
  },
  async logout({ commit, dispatch }) {
    await this.$axios
      .$delete('/api/v1/auth/sign_out')
      .then((res) => {
        commit('setCurrentUser', null)
        commit('setLoginUser', null)
        commit('setIsLoggedIn', false)
        commit('setIsAdmin', false)
        commit('snackbarMessage/setMessage', 'ログアウトしました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        this.$router.push('/')
        return res
      })
      .catch((err) => {
        console.log(err)
        commit('setCurrentUser', null)
        commit('setLoginUser', null)
        commit('setIsLoggedIn', false)
        commit('setIsAdmin', false)
        commit('snackbarMessage/setMessage', 'ログアウトしました。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'success', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
        commit('choise/setDrawer', false, { root: true })
        commit('choise/resetPosts', [], { root: true })
        dispatch('choise/deleteChoise', true, { root: true })
        this.$router.push('/')
      })
  },
}
