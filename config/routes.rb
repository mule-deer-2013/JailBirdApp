Jailbird::Application.routes.draw do

  resources :contacts
  resources :groups, except:[:index]
  root :to => 'contacts#index'

  match '/api/calls', to: 'api#calls'
  match '/api/group_sms', to: 'api#group_sms'
  match '/api/ivr', to: 'api#ivr'
  match '/api/transcribe_call', to: 'api#transcribe_call'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  match '/sessions/auth', to: 'sessions#auth'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
