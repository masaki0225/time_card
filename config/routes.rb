Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :projects, only: [:create, :destroy ]
  get '/projects/new', to: 'projects#new'
  get '/projects/:id', to: 'projects#show'
  
  get '/timekeep', to: 'time_keeps#show'
  post '/timekeep', to: 'time_keeps#create'
  get 'monthly', to: 'time_keeps#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  root 'home#home'
  get 'index', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
