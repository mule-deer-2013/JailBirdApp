Jailbird::Application.routes.draw do
  
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  root to: "contacts#index"

  match '/sessions/auth', to: 'sessions#auth'
end
