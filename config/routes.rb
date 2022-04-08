Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get "stocks/:id/buy", to: "stocks#buy", as: "user_buy_stock"
  resources :stocks
  resources :transactions, only: [:index, :create, :destroy]
  resources :investments, only: [:index, :create, :destroy]

  # Defines the root path route ("/")
  root "pages#home"
end
