Jailbird::Application.routes.draw do

  devise_for :users

  match '/google/import', to: 'google_api#new'
  match '/contacts/import', to: 'contacts#import'

  resources :contacts
  resources :groups, except:[:index]

  devise_scope :user do
    root to: "devise/registrations#new"
  end

  match '/api/calls', to: 'api#calls'
  match '/api/group_sms', to: 'api#group_sms'
  match '/api/ivr', to: 'api#ivr'
  match '/api/transcribe_call', to: 'api#transcribe_call'
  match '/api/dial', to: 'api#dial_contact'
  match '/api/voice_blast', to: 'api#voice_blast'
  match '/api/sms_blast', to: 'api#sms_blast'
  match '/api/voice_broadcasting', to: 'api#voice_broadcasting', :via => :post
  match '/api/sending_voice_message', to: 'api#sending_voice_message'

end
