/* eslint-disable */
export const actions = {
  async likeMessage({ commit, rootState }, authData) {
    await this.$axios
      .$post('/api/v1/message_likes', {
        user_id: authData.user,
        message_id: authData.message,
      })
      .then(() => {
        commit('flashMessage/setMessage', 'メッセージにいいね！しました', {
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
          'メッセージのいいね！に失敗しました。',
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
        commit('flashMessage/setMessage', 'いいね！から外しました。', {
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
        commit('flashMessage/setMessage', 'いいね！から外せませんでした。', {
          root: true,
        })
        commit('flashMessage/setType', 'error', { root: true })
        commit('flashMessage/setStatus', true, { root: true })
        setTimeout(() => {
          commit('flashMessage/setStatus', false, { root: true })
        }, 1000)
      })
  },
}
/* eslint-disable */
