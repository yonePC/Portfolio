Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/complete'

  resources :tags, only: [:index, :new, :create, :edit, :update, :destroy]

  resources :notifications, only: [:index]

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :stamps, only: [:create, :destroy]
  end
end
