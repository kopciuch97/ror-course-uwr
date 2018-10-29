Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home_page#index'

  resources :events, only: %i[index show]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
