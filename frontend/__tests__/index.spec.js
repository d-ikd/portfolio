import Index from '../pages/index.vue'

describe('pages/index.vue', () => {
  it('has a default value', () => {
    const defaultData = Index.data()
    // subTitle の初期値をテストする
    expect(defaultData.subTitle).toBe("Zenn is good service!!")
  })
})
