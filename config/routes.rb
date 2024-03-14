Rails.application.routes.draw do
  root 'items#index'
  
  resources :items

  devise_for :users

  resources :carts
  resources :users

  get 'team', to: 'static_pages#team'
  get 'uglycats', to: 'static_pages#uglycats'
  get 'fatcats', to:  'static_pages#fatcats'
  get 'desiguesedcats', to: 'static_pages#desiguesedcats'
  get 'contact', to: 'static_pages#contact'
  get 'help', to: 'static_pages#help'
  get 'privacypolicy', to: 'static_pages#privacypolicy'

  get "up" => "rails/health#show", as: :rails_health_check


end
