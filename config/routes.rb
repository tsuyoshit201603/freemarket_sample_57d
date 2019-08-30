Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root "products#index"
  resources :products
  resources :users, only: [:show] do
    resources :identifications, only: [:index]
    resources :telphones, only:[:new,:create]
    resources :addresses, only:[:new,:create]
    resources :payings, only:[:new,:create]
  end
  resources :singups, only:[:index]
  resources :finishings, only:[:index]
end
