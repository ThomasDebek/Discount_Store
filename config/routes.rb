Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products do
    resources :comments do
      member do
        get 'edit'
        post 'upvote'
        post 'downvote'
      end
    end
    collection do
      get 'search'
    end

  end
  get 'comments/edit'

  resources :coupons
  resources :promotions
end
