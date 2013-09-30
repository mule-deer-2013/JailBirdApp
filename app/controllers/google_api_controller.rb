class GoogleApiController < ApplicationController
  def new
    if session[:access_token]
      redirect_to '/google/create'
    else
      redirect_to user_auth.authorization_uri.to_s, status: 303
    end
  end

  def create
    unless session[:access_token]
      user_auth.code = params[:code] if params[:code]
      user_auth.fetch_access_token!
    end
    set_session
    redirect_to contacts_import_path
  end
end
