class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tumblr
    @user = User.from_omniatuh(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Tumblr") if is_navigational_format?
    else
      session["devise.tumblr_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end