Rails.application.routes.draw do
  root 'items#index'
  
  resources :items
  devise_for :users

  resources :join_table_items_carts
  resources :carts
  resources :users

  # Route vers la page d'équipe (assumant que vous avez un contrôleur StaticPagesController)
  get 'team', to: 'static_pages#team'
  get 'uglycats', to: 'static_pages#uglycats'
  get 'fatcats', to:  'static_pages#fatcats'
  get 'desiguesedcats', to: 'static_pages#desiguesedcats'
  # Décommentez cette ligne si vous avez besoin de définir une route vers la page d'équipe du contrôleur ItemsController
  # get 'team', to: 'items#index' 

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
