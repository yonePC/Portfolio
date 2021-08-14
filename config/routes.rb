Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  get 'users/complete'

  resources :tags, only: [:index, :new, :crate, :destroy]

  get 'notifications/index'

  resources :stamps, only: [:crate, :destroy]

  resources :comments, only: [:crate, :destroy]

  resources :posts, only: [:index, :show, :new, :crate, :edit, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
