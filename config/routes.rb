Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions: "admin/sessions",
    registrations: "admin/registrations"
  }

  devise_for :customers, path: 'customers', controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    get 'customers/confirm'

    patch 'customers/withdrawal'
    delete 'cart_items/destroy_all'
    resource :customers, only:[:show, :edit, :update]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :update, :create, :destroy]
    get 'orders/complete' => "orders#complete"
    post 'orders/confirm' => "orders#confirm"
    resources :orders, only:[:new, :show, :index, :create]
  end

  namespace :admin do
    get 'homes/top'
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
