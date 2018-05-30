Rails.application.routes.draw do
  root "static_pages#home"
  get "new", to: "users#new"
  delete "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"
  get "/login", to: "sessions#new"
  resources :categories, only: [:show]
  post "/add_to_cart/:id", to: "carts#add_to_cart", as: "add_to_cart"
  resources :users
  resources :products
  resources :static_pages
  resources :comments
  resources :ratings
  resources :carts
  resources :orders
  namespace :admin do
    root "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :categories
    resources :products
    resources :users
    resources :orders
  end
end
