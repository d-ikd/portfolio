// import Vuex from 'vuex'
// import { createLocalVue } from '@vue/test-utils'

const Vuex = require('vuex')
const { createLocalVue } = require('@vue/test-utils')
const cloneDeep = require('lodash.clonedeep')
const messages = require('../../store/snackbarMessage')

const localVue = createLocalVue()
localVue.use(Vuex)

describe('Snackbar', () => {
  let store

  beforeEach(() => {
    store = new Vuex.Store(cloneDeep(messages))
  })

  describe('actions', () => {
    test('Does the Snackbar show?', async () => {
      const payload = { message: 'testmessage', type: 'info', status: 'true' }
      await store.dispatch('showMessage', payload)
      expect(store.getters.message).toEqual(payload.message)
    })
  })
})
