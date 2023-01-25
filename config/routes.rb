Rails.application.routes.draw do

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # admin

  namespace :admin do
    get 'homes/top' => "homes#top", as: "top"

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:index, :show, :update]

    resources :order_details, only: [:update]

    resources :items, only: [:new, :create, :index, :show, :edit, :update]

    resources :genres, only: [:create, :index, :edit, :update]
  end

  # public

  scope module: :public do

    root to: 'homes#top'

    get 'homes/about' => "homes#about", as: "about"

    get 'customers/withdrawal' => "customers#withdrawal", as: "withdrawal"
    get 'customers/information/edit' => "customers#edit", as: "edit"
    patch 'customers/information' => "customers#update", as: "update"
    patch 'customers/status' => "customers#status", as: "status"
    resource :customers, only: [:show]


    resources :addresses, only: [:create, :edit, :update, :index, :destroy]

    post 'orders/order_check' => "orders#order_check", as: "order_check"
    get 'orders/order_finish' => "orders#order_finish", as: "order_finish"
    resources :orders, only: [:new, :create, :show, :index]

    delete 'cart_items/destroy_all' => "cart_items#destroy_all", as: "destroy_all"
    resources :cart_items, only: [:create, :index, :update, :destroy]

    resources :items, only: [:show, :index]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
