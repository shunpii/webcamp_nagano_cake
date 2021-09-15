Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin_users, module: "admin_users"
  namespace :admin do
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
