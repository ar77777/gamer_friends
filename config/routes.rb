Rails.application.routes.draw do
  root to: 'tops#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :rooms, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end