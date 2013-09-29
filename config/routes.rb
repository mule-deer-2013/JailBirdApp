Jailbird::Application.routes.draw do

  devise_for :users

  resources :contacts, only:[:index, :create, :new]
  root :to => 'contacts#index'

  match '/api/calls', to: 'api#calls'
  match '/api/group_sms', to: 'api#group_sms'
  match '/api/phonebook', to: 'api#phonebook'
  match '/api/transcribe_call', to: 'api#transcribe_call'

  match '/contacts/google', to: 'google_api#new'
  match '/contacts/import', to: 'contacts#import'
end
