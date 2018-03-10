class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate
  def facebook
     @user = User.from_omniauth(request.env["omniauth.auth"])
     sign_in_and_redirect @user
  end
end
