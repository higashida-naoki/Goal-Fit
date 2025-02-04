Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  root to: "user_side/homes#top"
  get '/homes/about' => 'user_side/homes#about', as: 'about'

  namespace :admin_side do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin_side do
    get 'trainings/index'
    get 'trainings/new'
    get 'trainings/show'
    get 'trainings/edit'
    get 'trainings/create'
    get 'trainings/update'
  end
  namespace :admin_side do
    get 'genres/index'
    get 'genres/edit'
    get 'genres/create'
    get 'genres/update'
  end
  namespace :admin_side do
    get 'homes/top'
  end
  namespace :user_side do
    get 'post_comments/create'
    get 'post_comments/destroy'
  end
  namespace :user_side do
    get 'relatiomships/create'
    get 'relatiomships/destroy'
    get 'relatiomships/followings'
    get 'relatiomships/followers'
  end
  namespace :user_side do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :user_side do
    get 'trainings/index'
    get 'trainings/show'
  end
  namespace :user_side do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/favorite'
    get 'users/update'
    get 'users/destroy'
  end
  namespace :user_side do
    get 'posts/index'
    get 'posts/show'
    get 'posts/new'
    get 'posts/create'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :user_side do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
