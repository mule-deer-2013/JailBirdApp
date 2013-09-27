class SessionsController < ApplicationController

	def new
		redirect_to user_credentials.authorization_uri.to_s, status: 303
	end

	def auth
		puts "Params:"
		p params
		user_credentials.code = params[:code] if params[:code]
		user_credentials.fetch_access_token!
		puts "User Credentials:"
		p user_credentials
		set_sessions(user_credentials)
		puts "Session:"
		p session
		redirect_to new_user_path
	end

end