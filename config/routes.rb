Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/withdrawal'
  get 'customers/status'
  namespace :admin do
    get 'orders/update'
  end
  namespace :adimin do
    get 'order_details/show'
    get 'order_details/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
    get 'genres/create'
    get 'genres/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'addresses/index'
  get 'addresses/edit'
  get 'addresses/create'
  get 'addresses/update'
  get 'addresses/destroy'
  get 'orders/new'
  get 'orders/order_check'
  get 'orders/order_finish'
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'
  get 'items/index'
  get 'items/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
