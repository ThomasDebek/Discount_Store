Rails.application.routes.draw do
  namespace :admin do
    get 'products/index'
  end

  devise_for :admins do
    root 'products#index'
  end

  devise_for :users
  get 'home/index'
  root 'home#index'
  

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

  get 'carts/show'
  get    'cart', to: 'carts#show'
  delete 'cart', to: 'carts#destroy'
  post   'cart', to: 'carts#add', as: 'add_to_cart'


  resources :orders, only: %i[create]
  resources :cart_items, only: %i[create update destroy]


end
