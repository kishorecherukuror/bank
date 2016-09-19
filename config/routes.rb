Rails.application.routes.draw do
  #resources :transcations

  get 'account/:id', to: "accounts#new" , as: "accounts"

  get 'accounts/create'
  post 'accounts/create'
  get 'accounts/deposit'
  post 'accounts/deposit'
  get 'accounts/withdraw'
  post 'accounts/withdraw'

  resources :users
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end