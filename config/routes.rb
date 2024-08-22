Rails.application.routes.draw do
  # get "static_pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"


  resources :confirmations, only: [:create, :edit, :new]
  # resources :users do
  #   resources :friendships
  # end
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"

  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token

  get "user/:id", to: "users#get_by_id"

  get "friends", to: "users#get"
  post "friends", to: "friendships#post"
  delete "unfriend", to: "friendships#destroy"
  get "my_friends", to: "friendships#get"

  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"

  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
  
  # Defines the root path route ("/")
  # root "posts#index"
end
