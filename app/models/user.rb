require 'securerandom'

class User < ActiveRecord::Base
  # devise :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:tumblr]

  def User.find_or_create_for_tumblr_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    # name;string uid:string provider:string access_token:string access_secret:string email:string password:string
    unless user
      user = User.create!(
        name:             auth.info.nickname,
        uid:              auth.uid,
        provider:         auth.provider,
        access_token:     auth.credentials.token,
        access_secret:    auth.credentials.secret,
        password:         SecureRandom.urlsafe_base64,
      )
    end

    return user
  end

end
