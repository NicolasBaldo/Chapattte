Rails.application.routes.draw do
  root 'items#index'
  
  resources :items

  devise_for :users

  resources :carts
  resources :users
  resources :orders
  resources :cart_items, only: [:create, :destroy]
  resources :static_pages


  get "up" => "rails/health#show", as: :rails_health_check


end
