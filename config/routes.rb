Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations', passwords: "users/passwords" }
  root "products#index"
  resources :products do
    resources :buyings, only:[:index, :new] do
      collection do
        get 'index', to: 'buyings#index'
        post 'pay', to: 'buyings#pay'
        get 'done', to: 'buyings#done'
      end
    end
    resources :buyings, only: :index
    collection do
      get 'search' 
    end
    collection do
      get 'addsearch' 
    end
  end

  namespace :api do
    resources :products, only: :index, defaults: { format: 'json' }
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
  resources :credits, only: [:index,:new,:show] do
    collection do
      post 'delete', to: 'credits#delete'
    end
  end
  resources :payings, only:[:new,:show] do
    collection do
      post 'pay', to: 'payings#pay'
    end
  end
end