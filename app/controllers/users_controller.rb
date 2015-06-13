require 'tumblr_client'

class UsersController < ApplicationController
  layout "application"

  before_action :authenticate_tumblr_client, :authenticate_user!

  def dashbord
    client = Tumblr::Client.new
    @tum = client.info
  end

  def reblog
  end

  def like
  end

  def configure
  end

  def select_view_blog
  end

  def select_action_blog
  end

  private
  def authenticate_tumblr_client
    Tumblr.configure do |config|
      config.consumer_key = ENV['TUMBLRANDOM_CONSUMER_KEY']
      config.consumer_secret = ENV['TUMBLRANDOM_CONSUMER_SECRET']
      config.oauth_token = current_user.access_token
      config.oauth_token_secret = current_user.access_secret
    end
  end

end
