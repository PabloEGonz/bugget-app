Rails.application.routes.draw do
  devise_for :users

  get '/user', to: 'users#index'
  get '/user_account', to: 'users#show'
  resources :categories do 
    resources :transacts, only: [:new, :create]
  end
  resources :transacts, only: [:show]
  root 'categories#index'
end
