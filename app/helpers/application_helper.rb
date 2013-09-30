module ApplicationHelper

	def user_auth
		@authorization ||= (
			auth = GOOGLE_CLIENT.authorization.dup
			auth.redirect_uri = 'http://localhost:3000/google/create'
			auth.update_token!(session)
			auth
		)
	end
	
end
