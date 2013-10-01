Jailbird::Application.routes.draw do

  devise_for :users

  match '/google/new', to: 'google_api#new'
  match '/google/create', to: 'google_api#create'
  match '/contacts/import', to: 'contacts#import'

  resources :contacts
  resources :groups, except:[:index]

  devise_scope :user do
    root to: "devise/registrations#new"
  end

  match '/api/ivr', to: 'api#ivr'
  match '/api/calls', to: 'api#calls'
  match '/api/dial', to: 'api#dial_contact'
  match '/api/group_sms', to: 'api#group_sms'
  match '/api/sms_blast', to: 'api#sms_blast'
  match '/api/voice_blast', to: 'api#voice_blast'
  match '/api/transcribe_call', to: 'api#transcribe_call'
  match '/api/sending_voice_message', to: 'api#sending_voice_message'
  match '/api/voice_broadcasting', to: 'api#voice_broadcasting', :via => :post
  match '/api/phone_validation', to: 'api#phone_validation'
  match '/api/jailbird_pin', to: 'api#jailbird_pin'
end
