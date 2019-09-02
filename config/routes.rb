Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root "products#index"
  resources :products do
    resources :buyings, only: :index
  end
  resources :users, only: [:show] do
    resources :identifications, only: [:index]
    resources :profiles, only:[:new]
  end
  resources :logouts, only:[:destroy]
  resources :signups, only:[:index]
  resources :finishings, only:[:index]
  resources :telphones, only:[:new,:create]
  resources :addresses, only:[:new,:create]
  resources :payings, only:[:new,:create]
end
