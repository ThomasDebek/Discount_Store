Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    root 'products#index'
    resources :products
  end


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
