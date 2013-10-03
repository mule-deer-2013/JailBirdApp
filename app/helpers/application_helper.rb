module ApplicationHelper

	def user_auth
		@authorization ||= (
			auth = GOOGLE_CLIENT.authorization.dup
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

	def user_gmail(auth_token)
		user_info_url = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=#{auth_token}"
		JSON.parse(RestClient.get user_info_url)['email']
	end

	def google_contacts(user_email, auth_token)
		contacts_url = "https://www.google.com/m8/feeds/contacts/#{user_email}/full?access_token=#{auth_token}&max-results=1000"
		RestClient.get contacts_url
	end
	
end
