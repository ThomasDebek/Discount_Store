Rails.application.routes.draw do
  devise_for :admins
  get 'carts/show'

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


  get    'cart', to: 'carts#show'
  delete 'cart', to: 'carts#destroy'
  post   'cart', to: 'carts#add', as: 'add_to_cart'


  resources :orders, only: %i[create]
  resources :cart_items, only: %i[create update destroy]


end
