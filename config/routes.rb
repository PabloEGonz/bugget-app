Rails.application.routes.draw do
  devise_for :users

  get '/user_account', to: 'users#show'
  resources :categories do 
    resources :transacts, only: [:new, :create]
  end
  resources :transacts, only: [:show]
  root 'users#index'
end
