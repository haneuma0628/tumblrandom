# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :recoverable, :validatable

  # devise :registerable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:tumblr]
  devise :omniauthable, :omniauth_providers => [:tumblr]

  def User.find_or_create_for_tumblr_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.create!(
        name:             auth.info.nickname,
        avater_file_name: auth.info.avatar,
        uid:              auth.uid,
        provider:         auth.provider,
        access_token:     auth.credentials.token,
        access_secret:    auth.credentials.secret )
    end

    return user
  end

end
