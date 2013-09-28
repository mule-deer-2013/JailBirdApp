require 'google/api_client'
require 'google/api_client/client_secrets'

client_secrets = Google::APIClient::ClientSecrets.load('config/auth')
client = Google::APIClient.new(
	application_name: "Jailbird",
)

client.authorization.client_id = client_secrets.client_id
client.authorization.client_secret = client_secrets.client_secret
client.authorization.scope = 'https://www.google.com/m8/feeds'

# contacts = client.discovered_api('contacts')

GOOGLE_CLIENT = client
# ENV["CONTACTS"] = contacts