class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.new(username: params[:user][:username], email: params[:user][:email])
    user.password = params[:user][:password]
  	if user.save
  		redirect_to root_path
  	else
  		redirect_to new_user_path
  	end
  end
end