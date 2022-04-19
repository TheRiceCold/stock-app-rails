Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
<<<<<<< HEAD
  ActiveAdmin.routes(self)
  resources :investments
  resources :stocks
=======
  ActiveAdmin.routes self

>>>>>>> origin/main-clone
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
    
  }

<<<<<<< HEAD
  patch 'admin/users/:id/active', to: 'users#active', as: 'active_user'
  patch 'admin/users/:id/inactive', to: 'users#inactive', as: 'inactive_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # post "stocks/:id", to: "transactions#create"
  resources :stocks, only: [:index, :show]
  resources :investments, only: [:index, :show]
  resources :transactions, only: [:index, :show, :create]
=======
  resources :companies, only: :show do
    get 'prices', to: 'companies#prices'
>>>>>>> origin/main-clone

    resources :transactions, only: [:new, :create]
  end

  resources :transactions, only: :index

  # get 'add_wallet', to: 'wallet#add', as: 'add_wallet'
  get 'portfolio', to: 'investments#index', as: 'portfolio'
  get 'stock_market', to: 'pages#stock_market', as: 'stock_market'

  root 'pages#home'
end
