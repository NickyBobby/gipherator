Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:show, :index, :new, :create]
  resources :gifs

  namespace :admin do
    resources :categories, only: [:index, :new, :show]
  end

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
end
