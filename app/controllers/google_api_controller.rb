class GoogleApiController < ApplicationController
  def new
    redirect_to user_auth.authorization_uri.to_s, status: 303
  end

  def create
    user_auth.code = params[:code] if params[:code]
    user_auth.fetch_access_token!
    session[:access_token] = user_auth.access_token
    redirect_to contacts_import_path
  end
end
