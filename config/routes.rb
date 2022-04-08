Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  # post "stocks/:id", to: "transactions#create"
  resources :stocks, only: [:index, :show]
  resources :investments, only: [:index, :show]
  resources :transactions, only: [:index, :show, :create]

  # Defines the root path route ("/")
  root "pages#home"
end
