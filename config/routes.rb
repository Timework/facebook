Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :new, :show, :edit] do
    resources :profiles, only: [:create, :update]
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resource :invitations, only: [:create, :update, :destroy]
  root "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end