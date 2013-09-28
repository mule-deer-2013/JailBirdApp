class OmniauthCallbacksController < Devise::OmnitauthCallbacksController
  def google_oauth2
    user = User.from_omniauth_request.env["omniauth.auth"]
    if user.persisted?
      flash.notice = "Signed in through Google!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "You are almost done! Please provide a password to finish setting up your account."
      redirect_to new_user_registration_url
    end
  end
end