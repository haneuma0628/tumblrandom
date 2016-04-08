require 'tumblr_client'
require 'omniauth-tumblr'

class User < ActiveRecord::Base
  has_many :identity
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:tumblr]

  def self.tumblr
    Identity.first
  end

  def self.authenticate_tumblr_client
    Tumblr.configure do |config|
      config.consumer_key = ENV['TUMBLRANDOM_CONSUMER_KEY']
      config.consumer_secret = ENV['TUMBLRANDOM_CONSUMER_SECRET']
      config.oauth_token = self.tumblr.access_token
      config.oauth_token_secret = self.tumblr.access_secret

      @client = Tumblr::Client.new
      return @client
    end
  end
end
