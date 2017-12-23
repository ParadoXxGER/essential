Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end

  post '/graphql', to: 'graphql#execute'

  root 'newsfeed#show'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
      resources :newsfeed
      post '/user-query', to: 'user_query#execute'
    end
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#index', as: 'admin_dashboard'
    get '/settings', to: 'settings#index', as: 'admin_settings'
    resources :users
    resources :posts
    resources :pages
  end

  get '/newsfeed', to: 'newsfeed#show', as: 'newsfeed'

  resources :login, controller: 'user_sessions', only: %i[index create], as: 'login'
  post '/logout', to: 'user_sessions#destroy'


end
