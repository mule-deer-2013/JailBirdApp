module ApplicationHelper

	def user_auth
		@authorization ||= (
			auth = GOOGLE_CLIENT.authorization.dup
			auth.redirect_uri = 'http://localhost:3000/google/create'
			auth.update_token!(session)
			auth
		)
	end

	def set_session
		session[:access_token] = user_auth.access_token
		session[:refresh_token] = user_auth.refresh_token
		session[:expires_at] = user_auth.expires_at
		session[:issued_at] = user_auth.issued_at
	end
	
end
