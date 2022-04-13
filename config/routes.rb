Rails.application.routes.draw do
  root "posts#index"

  resources :posts, only: %i[ index show new create ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end