Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'top#index'

  get 'mypage', to: 'mypage#index'
  get 'logout', to: 'logout#index'
  get 'card-registration/new', to: 'card_registration#new'

  resources :top,        only: :index

  post 'exhibitions/new', to: 'exhibitions#create', as: 'exhibitions'
  resources :exhibitions, except: :create do
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
  resources :categories,  only:[:index, :show]
  resources :brands,  only:[:index, :show]

  resources :purchases, only: :buy do
    member do
      get  'buy'
      post 'pay'
    end
  end


  devise_scope :user do
    get  'users',     to: redirect("/users/sign_up")
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    resources :users, only: :index
  end

  resources :card, except: :edit
end