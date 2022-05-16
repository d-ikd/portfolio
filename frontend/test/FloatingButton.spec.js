import { mount } from '@vue/test-utils'
import Button from '~/components/shared/Button'
import ButtonPostCreate from '~/components/layouts/ButtonPostCreate.vue'

describe('Button', () => {
  test('Display text', () => {
    const props = {
      text: '検索する'
    }
    const wrapper = mount(Button, {
      propsData: props
    })
    // propsに指定したデータが正しく表示されること
    expect(wrapper.props('text')).toBe(props.text)
  })
})
