Rails.application.routes.draw do
  resources :publicacions
  resources :investigacions
  resources :investigadors
  get 'home/index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root  "home#index"
end
