Rails.application.routes.draw do
  #管理者用deviseルーティング
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: 'admin_side/sessions',
  }
  #ユーザー用deviseルーティング
  devise_for :users, skip: [:passwords], controllers: {
    sessions: 'user_side/sessions',
    registrations: 'user_side/registrations',
  }
  
  #管理者用ルーティング
  namespace :admin_side do
    get "top" => "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :trainings, only: [:index, :new, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end

  #ユーザー用ルーティング
  scope module: :user_side do
    root to: "homes#top"
    get '/homes/about' => 'homes#about', as: 'about'

    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      collection do
        get "favorites" 
      end   
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :trainings, only: [:index, :show]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
