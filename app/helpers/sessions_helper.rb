module SessionsHelper
	def user_credentials
		@authorization ||= (
			auth = GOOGLE_CLIENT.authorization.dup
			auth.redirect_uri = 'https://localhost:3000/sessions/create'
			auth.update_token!(session)
			auth
		)
	end

	def set_sessions
		session[:access_token] = user_credentials.access_token
  	session[:refresh_token] = user_credentials.refresh_token
  	session[:expires_in] = user_credentials.expires_in
  	session[:issued_at] = user_credentials.issued_at
	end
end