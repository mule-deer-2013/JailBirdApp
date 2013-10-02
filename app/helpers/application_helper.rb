module ApplicationHelper

	def user_auth
		@authorization ||= (
			auth = GOOGLE_CLIENT.authorization.dup
			auth.redirect_uri = GOOGLE_CLIENT.authorization.redirect_uri
			auth.update_token!(session)
			auth
		)
	end

	def google_auth_token
		if session[:access_token]
			session[:access_token]
		else
			flash[:errors] = "No token in session."
			redirect_to root_path
		end
	end

	def user_info_url(auth_token)
		"https://www.googleapis.com/oauth2/v2/userinfo?access_token=#{auth_token}"
	end

	def google_contacts_url(user_email, auth_token)
		"https://www.google.com/m8/feeds/contacts/#{user_email}/full?access_token=#{auth_token}&max-results=1000"
	end
	
end
