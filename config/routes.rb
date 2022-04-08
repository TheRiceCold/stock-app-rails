Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :investments
  resources :stocks
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
    
  }

  patch 'admin/users/:id/active', to: 'users#active', as: 'active_user'
  patch 'admin/users/:id/inactive', to: 'users#inactive', as: 'inactive_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # post "stocks/:id", to: "transactions#create"
  resources :stocks, only: [:index, :show]
  resources :investments, only: [:index, :show]
  resources :transactions, only: [:index, :show, :create]

  # Defines the root path route ("/")
  root "pages#home"
end
