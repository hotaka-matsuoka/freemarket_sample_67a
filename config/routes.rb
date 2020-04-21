Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'top#index'
  resources :top,        only:[:index]
  resources :exhibitions, except: :show
  devise_scope :user do
    get  'users',     to: redirect("/users/sign_up")
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'top#index'
  resources :top,  only: [:index]
  resources :card, except: :edit
end