Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/timecard', to: 'time_cards#show'
  post '/timecard', to: 'time_cards#create'
  get 'monthly', to: 'time_cards#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  root 'home#home'
  get 'index', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
