Jailbird::Application.routes.draw do

  resources :contacts, only:[:index, :create, :new]
  root :to => 'contacts#index'

  match '/api/calls', to: 'api#calls'
  match '/api/group_sms', to: 'api#group_sms'
  match '/api/phonebook', to: 'api#phonebook'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  match '/sessions/auth', to: 'sessions#auth'
end
