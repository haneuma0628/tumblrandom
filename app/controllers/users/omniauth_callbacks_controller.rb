class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout "entrance"

  def tumblr
    @user = User.find_or_create_for_tumblr_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message( :notice, :success, :kind => 'Tumblr' ) if is_navigational_format?
    else
      # session['devise.tumblr_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end

  end
end
