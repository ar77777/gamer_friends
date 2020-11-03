Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :rooms, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end
end