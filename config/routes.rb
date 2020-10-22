Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: 'tops#index'
  resources :posts
  resources :rooms, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end
end