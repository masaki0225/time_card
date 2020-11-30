Rails.application.routes.draw do
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  root 'home#home'
  get 'index', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
