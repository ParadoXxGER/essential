Rails.application.routes.draw do

  namespace :api, { defaults: { format: :json } } do
    namespace :v1 do
      resources :text_posts
      resources :photo_album_posts
      resources :file_posts
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'hello#show'

  resources :login, controller: 'user_sessions', only: [:index, :create], as: 'login'
  resources :logout, controller: 'user_sessions', only: [:destroy], as: 'logout'

end
