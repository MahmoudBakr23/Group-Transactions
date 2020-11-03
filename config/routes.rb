Rails.application.routes.draw do
  get 'external_charges/index'
  resources :groups
  resources :charges
  resources :users, only: %i[show destroy]
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'home/index'
  root 'home#index'
end
