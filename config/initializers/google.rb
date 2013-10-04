require 'google/api_client'
require 'google/api_client/client_secrets'

client = Google::APIClient.new(
	application_name: "Jailbird",
)
unless Rails.env.production?
  client_secrets = Google::APIClient::ClientSecrets.load('config/auth')
  client_id = client_secrets.client_id
  client_secret = client_secrets.client_secret
  redirect_uri = 'http://localhost:3000/google/create'
else
  client_id = ENV['GOOGLE_APP_ID']
  client_secret = ENV['GOOGLE_APP_SECRET']
  redirect_uri = ENV['GOOGLE_REDIRECT']
end

client.authorization.client_id = client_id
client.authorization.client_secret = client_secret
client.authorization.redirect_uri = redirect_uri

client.authorization.scope = ['https://www.google.com/m8/feeds', 'https://www.googleapis.com/auth/userinfo.email']

GOOGLE_CLIENT = client
