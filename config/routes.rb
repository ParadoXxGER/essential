Rails.application.routes.draw do
  root 'newsfeed#show'

  namespace :api, { defaults: { format: :json } } do
    namespace :v1 do
      # Remember! Do never manually access Parental Class POSTS!!!! Only its childs!
      resources :posts
      resources :newsfeed
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/newsfeed', to: 'newsfeed#show', as: 'newsfeed'

  resources :login, controller: 'user_sessions', only: [:index, :create], as: 'login'
  post '/logout', to: 'user_sessions#destroy'


end
