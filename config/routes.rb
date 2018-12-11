Rails.application.routes.draw do

  devise_for :users #, :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home_page#index'

  resources :events, only: %i[index show]
  resources :tickets, except: %i[index] do
    member do
      post :buy
    end
  end

  namespace :user_panel, path: 'users' do
    root to: 'profile#index'
  end

  namespace :api do
    get 'users/email_exists', to: 'users#email_exists'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
