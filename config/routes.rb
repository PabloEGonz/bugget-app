Rails.application.routes.draw do
  devise_for :users

  get '/user', to: 'users#index'
  resources :categories do 
    resources :transacts, only: [:new, :create]
  end
  resources :transacts, only: [:show]
  root 'categories#index'
end
