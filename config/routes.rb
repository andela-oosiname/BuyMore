Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'products#index'

  resources :products
  get "/cart", to: "carts#index", as: :cart_index
  post "/cart", to: "carts#add_item"
end
