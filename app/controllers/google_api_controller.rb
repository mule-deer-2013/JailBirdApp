class GoogleApiController < ApplicationController
	def new
		auth = GOOGLE_CLIENT.authorization.dup
    auth.redirect_uri = 'http://localhost:3000/contacts/import'
    auth.update_token!(session)
		redirect_to auth.authorization_uri.to_s, status: 303
	end
end