Rails.application.routes.draw do
  root to: 'homes#index'
  # get 'homes', to: 'homes#index'

  namespace :api do
    namespace :v1 do
      get 'ping', to: 'sessions#ping'
      post 'login', to: 'sessions#login'
      delete 'logout', to: 'sessions#logout'
      get 'pinga', to: 'sessions#pinga'

      resources :posts, only: %i[index show create update destroy]
    end
  end
end
