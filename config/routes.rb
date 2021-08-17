Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/complete'

  resources :tags, only: [:index, :new, :create, :destroy]

  get 'notifications/index'

  resources :stamps, only: [:create, :destroy]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
