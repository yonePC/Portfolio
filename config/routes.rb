Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/complete'

  resources :tags, only: [:index, :new, :create, :destroy]

  get 'notifications/index'

  resources :stamps, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  resources :posts
  # resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
