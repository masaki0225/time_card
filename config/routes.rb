Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :projects, only: [:create, :destroy, :update] do
    resources :participations, only: [:create] do
    end
    resources :comments, only: [:create]
    get 'comments/:id', to: 'comments#show'
  end

  get '/projects/new', to: 'projects#new'
  get '/projects/:id', to: 'projects#show'
  get '/projects/edit/:id', to: 'projects#edit', as: "edit_project"


  delete '/commentout/:id', to: 'comments#destroy', as: "commentout"
  delete '/nonparticipation/:project_id/:id', to: 'participations#destroy', as: 'nonparticipation'

  get '/timekeep', to: 'time_keeps#show'
  post '/timekeep', to: 'time_keeps#create'
  get 'monthly', to: 'time_keeps#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#home'
  get 'index', to: 'home#index'
  get 'about', to: 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
