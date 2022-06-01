require 'rails_helper'

RSpec.describe Post, type: :request do
  describe 'Post' do
    before(:each) do
      @post = create(:post)
      @posts = create_list(:post, 10)
    end

    it '全ての投稿を取得' do
      get '/api/v1/posts'
      JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end

    it '特定の投稿を取得' do
      get "/api/v1/posts/#{@post.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 要求した特定のポストのみ取得した事を確認する。
      expect(json['name']).to eq(@post.name)
    end

    # it '新規投稿' do
    #   post_params = {
    #     name: 'posttest',
    #     user_id: '1',
    #     quickword: '右下のボタンで募集ページをつくりましょう！',
    #     catchcopy: '閲覧ありがとうございます！',
    #     member: '3',
    #     place: '集合場所',
    #     category: '',
    #     price: '1000',
    #     start_time: '2000-01-01T09:00:00.000Z',
    #     finish_time: '2000-01-01T03:00:00.000Z',
    #     release: '2021-5-10',
    #   }

    #   # データが作成されている事を確認。
    #   expect { post '/api/v1/posts', params: post_params }.to change(Post, :count).by(+1)

    #   # リクエスト成功を表す200が返ってきたか確認する。
    #   expect(response.status).to eq(200)
    # end

    it '投稿編集' do
      post = create(:post, name: 'old-title')

      put "/api/v1/posts/#{post.id}", params: { name: 'new-title' }
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # データが更新されている事を確認。
      expect(json['name']).to eq('new-title')
    end
    it '投稿削除' do
      post = create(:post)

      # データが削除されている事を確認。
      expect { delete "/api/v1/posts/#{post.id}" }.to change(Post, :count).by(-1)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end
  end
end
