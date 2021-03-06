Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:show, :index, :new, :create]
  resources :gifs, only: [:update, :destroy]
  
  namespace :admin do
    resources :categories, only: [:new, :create]
    resources :gifs, only: [:index, :create, :edit, :update, :destroy]
  end

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
