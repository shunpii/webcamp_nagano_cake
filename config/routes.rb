Rails.application.routes.draw do
  devise_for :admin_users
  namespace :admin do
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
