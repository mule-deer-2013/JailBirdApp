Jailbird::Application.routes.draw do
  resources :users, only: [:new, :create]
  root to: "contacts#index"
end
