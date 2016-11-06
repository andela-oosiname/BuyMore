Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'products#index'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :products, only: [:new, :create, :edit, :update]

  get "/cart", to: "carts#index", as: :cart_index
  post "/cart", to: "carts#add_item"

  get "/set-cart", to: "carts#set_cart", as: :set_cart
  get "/cart/delete/:id", to: "carts#remove_item", as: "remove-item"

  resources :customers, only: [:new, :create]

  resources :orders, only: [:new, :index]
end
