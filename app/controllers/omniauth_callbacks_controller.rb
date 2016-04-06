class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  layout "entrance"

  def tumblr
    @identity = Identity.find_for_oauth request.env['omniauth.auth']
    @user = @identity.user || current_user
    # if @user.nil?
    unless @user
      @user = User.create!( user_id: @identity.user_id, email: @identity.email || "" )
      @identity.update_attribute( :user_id, @user.id )
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute( :email, @identity.email )
    end

    if @user.persisted?
      @identity.update_attribute( :user_id, @user_id )
      @user = FromUser.find @user.id
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message( :notice, :success, kind: 'Tumblr' ) if is_navigational_format?
    else
      session["devise.tumblr_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to '/tumblrandom/entrance'
    end
  end
end
