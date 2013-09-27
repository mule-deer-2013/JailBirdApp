module SessionsHelper
	def user_credentials
		@authorization ||= (
			auth = GOOGLE_CLIENT.authorization.dup
			auth.redirect_uri = 'http://localhost:3000/sessions/auth'
			auth.update_token!(session)
			auth
		)
	end

	def set_sessions(user_creds)
		session[:access_token] = user_creds.access_token
  	session[:refresh_token] = user_creds.refresh_token
  	session[:expires_in] = user_creds.expires_in
  	session[:issued_at] = user_creds.issued_at
	end
end