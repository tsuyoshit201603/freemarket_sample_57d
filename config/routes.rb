Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root "products#index"
  resources :products
  resources :users, only: [:show] do
    resources :identifications, only: [:index]
  end
end
