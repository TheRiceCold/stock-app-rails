Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes self

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :companies, only: :show do
    get 'prices', to: 'companies#prices'

    resources :transactions, only: [:new, :create]
  end

  resources :transactions, only: :index

  # get 'add_wallet', to: 'wallet#add', as: 'add_wallet'
  get 'portfolio', to: 'investments#index', as: 'portfolio'
  get 'stock_market', to: 'pages#stock_market', as: 'stock_market'

  root 'pages#home'
end
