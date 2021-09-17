Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'orders/show'
  end
  devise_for :admin_users, module: "admin_users"
  namespace :admin do
    get 'homes/top'
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :order, only:[:show, :update]
    resources :order_details, only:[:update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
