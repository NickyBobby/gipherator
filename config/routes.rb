Rails.application.routes.draw do
  get '/', to: "users#index"
  resources :users, only: [:show, :index]
end
