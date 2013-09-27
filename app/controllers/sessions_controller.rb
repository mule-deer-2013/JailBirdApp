class SessionsController < ApplicationController

	def new
		redirect_to user_credentials.authorization_uri.to_s, status: 303
	end

	def create
		p params
		user_credentials.code = params[:code] if params[:code]
		user_credentials.fetch_access_token!
		set_sessions(user_credentials)
		# @user = User.new(session)
	end

end