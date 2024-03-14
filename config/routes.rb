Rails.application.routes.draw do
  root 'items#index'
  
 

  devise_for :users

  resources :items
  resources :carts
  resources :users
  resources :orders

  namespace :admin do
    root to: 'admin/items#index'
    resources :users
    resources :orders
    resources :items
  end
  
  resources :cart_items
  resources :static_pages


  get "up" => "rails/health#show", as: :rails_health_check


end
