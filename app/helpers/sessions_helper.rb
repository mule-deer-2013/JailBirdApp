module SessionsHelper
	# def user_credentials
	# 	@authorization ||= (
	# 		auth = GOOGLE_CLIENT.authorization.dup
	# 		auth.redirect_uri = 'http://localhost:3000/sessions/auth'
	# 		auth.update_token!(session)
	# 		auth
	# 	)
	# end

	# def set_sessions(user_creds)
	# 	session[:access_token] = user_creds.access_token
 #  	session[:refresh_token] = user_creds.refresh_token
 #  	session[:expires_in] = user_creds.expires_in
 #  	session[:issued_at] = user_creds.issued_at
	# end

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

end