Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products do
    resources :comments
    collection do
      get 'search'
    end
    member do
      get 'edit'
    end
  end
  get 'comments/edit'

  resources :coupons
  resources :promotions
end
