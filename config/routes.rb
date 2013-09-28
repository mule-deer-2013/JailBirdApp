Jailbird::Application.routes.draw do

  resources :contacts, only:[:index, :create, :new]
  resources :groups, only:[:create, :new, :edit, :show]
  root :to => 'contacts#index'

  match '/api/calls', to: 'api#calls'
  match '/api/group_sms', to: 'api#group_sms'
  match '/api/ivr', to: 'api#ivr'
  match '/api/transcribe_call', to: 'api#transcribe_call'
  match '/api/ivr', to: 'api#ivr'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  match '/sessions/auth', to: 'sessions#auth'
end
