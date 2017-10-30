Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'hello#show'

  resources :login, controller: 'user_sessions', only: [:index, :create], as: 'login'
  resources :logout, controller: 'user_sessions', only: [:destroy], as: 'logout'

end
