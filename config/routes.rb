Rails.application.routes.draw do
  get 'home', to: 'home#home'
  get 'index', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
