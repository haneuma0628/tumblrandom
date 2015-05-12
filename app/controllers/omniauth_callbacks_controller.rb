# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tumblr
    @user = User.from_omniatuh(request.env["omniauth.auth"])
    redirect_to '/'

    # if @user.persisted?
    #   flash.notice = "Sign in with Tumblr!"
    #   # sign_in_and_redirect @user
    #   sign_in_and_redirect '/'
    # else
    #   session["devise.user_attributes"] = user.attributes
    #   redirect_to '/'
    # end
  end
end

