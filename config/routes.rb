Rails.application.routes.draw do
  get 'carts/show'
  get 'carts/index'

  devise_for :owners, :controllers => {
    :registrations => 'owners/registrations',
    :sessions => 'owners/sessions'   
  } 
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:create, :index]
    collection do
      get 'search'
    end
    collection do
      get 'type'
    end
    resources :favorites, only: [:create, :destroy, :index]
    scope module: :items do
      resources :add_to_carts, only: [:create]
      resources :delete_in_carts, only: [:create]
    end
  end
  
  resources :omise, only: [:index]
  resources :rule, only: [:index]
  resources :news, only: [:index]
  resources :delivery, only: [:index]
  resources :carts, only: [:index]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
