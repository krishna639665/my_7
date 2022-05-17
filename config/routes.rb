Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "page#index"
  get "login", to: "page#login"
  get "signup", to: "users#new"
  resources :users
  resources :articles
end
