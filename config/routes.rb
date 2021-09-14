Rails.application.routes.draw do
  devise_for :admin_users, :controllers => {
    :sessions => 'admin_users/sessions',
    :passwords => 'admin_users/passwords',
    :registrations => 'admin_users/registrations'
  }
  namespace :admin do
    resources :items, only:[:new, :index, :show, :edit, :create, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
