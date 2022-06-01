require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Creates Post' do
    post = create(:post, name: 'testpost')
    expect(post).to be_valid
  end
end
