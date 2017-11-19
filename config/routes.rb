Rails.application.routes.draw do
  root 'newsfeed#show'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
      resources :newsfeed
    end
  end
  get '/newsfeed', to: 'newsfeed#show', as: 'newsfeed'
  resources :login, controller: 'user_sessions', only: %i[index create], as: 'login'
  post '/logout', to: 'user_sessions#destroy'
end
