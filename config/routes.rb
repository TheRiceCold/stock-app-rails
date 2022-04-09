Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes self

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resources :investments, only: :index
  resources :stocks, only: [:index, :show]
  resources :transactions, only: [:index, :show, :create]

  root "pages#home"
end
