Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'top#index'
  resources :top,  only: :index
  resources :card, except: :edit
  resources :categories,  only: [:index, :show]
  resources :brands, only: [:index, :show]
  resource  :mypage, only: :show do 
    resources :card_registration, only: [:index, :new, :create, :destroy]
    resource  :logout, only: :show
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  get 'search', to: 'top#search'

  post 'exhibitions/new', to: 'exhibitions#create', as: 'exhibitions'
  resources :exhibitions, except: :create do
    resources :favorites, only: [:create, :destroy]
    resources :comments,  only: [:index, :create]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end

  resources :purchases, only: [:but, :pay] do
    member do
      get  'buy', to: 'purchases#buy'
      post 'pay', to: 'purchases#pay'
    end
  end

  devise_scope :user do
    get  'users',     to: redirect("/users/sign_up")
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    resources :users, only: :index
  end

end