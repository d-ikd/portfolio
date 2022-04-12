Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1, format: 'json' do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      resources :tasks, only: %i[index]
      resources :users, only: %i[index show destroy]
      get 'health_check', to: 'health_check#index'
    end
  end
end
