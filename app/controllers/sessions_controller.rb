class SessionsController < ApplicationController

	# def new
	# 	redirect_to user_credentials.authorization_uri.to_s, status: 303
	# end

	# def auth
	# 	user_credentials.code = params[:code] if params[:code]
	# 	user_credentials.fetch_access_token!
	# 	set_sessions(user_credentials)
	# 	redirect_to new_user_path
	# end

	def new
	end

	def create
		user = User.find_by_email(params[:email].downcase)
		if user && user.authenticate(params[:password])
			sign_in(user)
			redirect_to root_path
		else
			redirect_to new_session_path
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end

end