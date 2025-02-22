Rails.application.routes.draw do

  #管理者用deviseルーティング
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin_side/sessions',
  }
  #ユーザー用deviseルーティング
  devise_for :users, controllers: {
    sessions: 'user_side/sessions',
    registrations: 'user_side/registrations',
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "user_side/sessions#guest_sign_in"
  end
  
  #管理者用ルーティング
  namespace :admin_side do
    get "top" => "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :foods, only: [:index, :new, :show, :edit, :create, :update, :destroy]
    resources :exercises, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  end

  #ユーザー用ルーティング
  patch "users/information" => "user_side/users#update", as: "info_update"
  get "users/unsubscribe" => "user_side/users#unsubscribe", as: "unsubscribe"
  patch "users/withdraw" => "user_side/users#withdraw", as: "withdraw"

  scope module: :user_side do
    root to: "homes#top"
    get '/homes/about' => 'homes#about', as: 'about'

    resources :users, only: [:edit, :index, :show, :update, :destroy] do
      member do
        get "favorites" 
      end   
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    resources :trainings, only: [:index, :show]
    resources :foods, only: [:index]
    resources :exercises, only: [:index]
  end

  get 'searches/search'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


