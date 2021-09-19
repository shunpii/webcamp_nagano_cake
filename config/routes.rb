Rails.application.routes.draw do
  devise_for :public_users, module: "public_users"
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    get 'customers/confirm'
    patch 'customers/withdrawal'
    resources :customers, only:[:show, :edit, :update]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  devise_for :admin_users, module: "admin_users"
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
