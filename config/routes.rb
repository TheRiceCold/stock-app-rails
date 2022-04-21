Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes self


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

  resources :companies, only: :show do
    get 'prices', to: 'companies#prices'
    get 'transactions/buy', to: 'transactions#buy'
    get 'transactions/sell', to: 'transactions#sell'

    resources :transactions, only: :create
    resources :investments, only: :index

  end

  resources :transactions, only: :index
  resources :investments, only: [:index, :show]

  # get 'add_wallet', to: 'wallet#add', as: 'add_wallet'
  get 'portfolio', to: 'investments#index', as: 'portfolio'
  get 'stock_market', to: 'pages#stock_market', as: 'stock_market'

  root 'pages#stock_market'
end
