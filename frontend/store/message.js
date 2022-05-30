/* eslint-disable */
export const actions = {
  async likeMessage({ commit, rootState }, authData) {
    await this.$axios
      .$post('/api/v1/message_likes', {
        user_id: authData.user,
        message_id: authData.message,
      })
      .then(() => {
        commit('snackbarMessage/setMessage', 'メッセージにいいね！しました', {
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
          'メッセージのいいね！に失敗しました。',
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
  async unLikeMessage({ rootState, commit }, authData) {
    await this.$axios
      .$delete('/api/v1/message_likes', {
        params: {
          user_id: authData.user,
          message_id: authData.message,
        },
      })
      .then(() => {
        console.log('Successfully unlike')
        commit('snackbarMessage/setMessage', 'いいね！から外しました。', {
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
        commit('snackbarMessage/setMessage', 'いいね！から外せませんでした。', {
          root: true,
        })
        commit('snackbarMessage/setType', 'error', { root: true })
        commit('snackbarMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('snackbarMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
}
/* eslint-disable */
