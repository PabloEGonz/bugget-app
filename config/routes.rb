Rails.application.routes.draw do
  devise_for :users

  get '/user', to: 'users#index'
end
