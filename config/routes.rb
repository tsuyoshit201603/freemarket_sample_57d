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
    resources :exhibitings, only:[:index]
  end

  namespace :api do
    resources :products, only: [:index,:edit], defaults: { format: 'json' }
  end

  resources :users, only: [:show] do
    resources :identifications, only: [:index]
    resources :profiles, only:[:new]
    get  "exhibiting"  => "exhibitings#exhibiting" do
      resources :products, only: [:destroy] 
    end
    get  "trading"     => "exhibitings#trading"
    get  "sold"        => "exhibitings#sold"
  end
  resources :logouts, only:[:index]
  resources :signups, only:[:index]
  resources :finishings, only:[:index]
  resources :telphones, only:[:new,:create]
  resources :addresses, only:[:new,:create]
  resources :credits, only: [:index,:new,:show] do
    collection do
      post 'delete', to: 'credits#delete'
    end
  end
  resources :payings, only:[:new] do
    collection do
      post 'pay', to: 'payings#pay'
    end
  end
end