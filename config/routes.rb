Rails.application.routes.draw do
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :boards, only: [:new, :create]
  end
  resources :boards do
    resources :comments, only: [:new, :create]
  end
  resources :cards

  resource :profile, only: [:show, :edit, :update]
end