Rails.application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create' , :via => [:get, :post]
  match 'auth/failure', to: redirect('/') , :via => [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout' , :via => [:get, :post]
  get 'users/:id/profiles', to: 'users#show', id: /\d+/
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :new, :show, :edit] do
    resources :profiles, only: [:create, :update, :show,]
  end
  resources :posts, except: [:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resource :invitations, only: [:create, :update, :destroy]
  root "users#index"
  devise_scope :user do
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
