Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'user/:id/followings' => 'users#followings', as: "user_followings"
  get 'user/:id/followers' => 'users#followers', as: "user_followers"
  get 'search' => 'searches#search'
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end