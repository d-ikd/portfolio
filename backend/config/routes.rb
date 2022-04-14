Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1, format: 'json' do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      get 'isLike', to: 'post_likes#isLike'
      get 'allpost', to: 'posts#allfood'
      get 'new_post', to: 'posts#new_post'
      get 'new_plan_post', to: 'foods#new_plan_post'
      resources :posts, only: %i[index show create update destroy] do
        get :search, on: :collection
      end
      resources :recommends, only: %i[index create destroy]
      resources :pickups, only: %i[index create destroy]
      resources :tasks, only: %i[index]
      resources :users, only: %i[index show destroy]
      get 'health_check', to: 'health_check#index'
    end
  end
end
