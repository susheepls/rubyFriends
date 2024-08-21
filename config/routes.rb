Rails.application.routes.draw do
  # get "static_pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"


  resources :confirmations, only: [:create, :edit, :new], params: :confirmation_token
  # resources :users do
  #   resources :friendships
  # end
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destory"
  get "login", to: "sessions#new"

  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  # Defines the root path route ("/")
  # root "posts#index"
end
