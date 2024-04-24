Rails.application.routes.draw do
  # devise_for :users
  get "About", to: "about#index"

  get "signup", to: "signup#signup"

  get "signin", to: "signin#signin"

  post '/signup', to: 'users#create'

  root to:"main#index"

  resources :sessions, only: [:new, :create]

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  get '/menu', to: 'menu#index', as: 'menu' 


  
  delete '/users/delete_selected', to: 'users#delete_selected', as: 'delete_selected_users'

  put '/users/block_selected', to: 'users#block_selected', as: 'block_selected_users'


  
 
  

  
  resources :users, only: [:new, :create, :update, :destroy]



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
