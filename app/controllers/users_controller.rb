require 'tumblr_client'

class UsersController < ApplicationController
  layout "application"

  def dashbord
    Tumblr.configure do |config|
      config.consumer_key = ENV['TUMBLRANDOM_CONSUMER_KEY']
      config.consumer_secret = ENV['TUMBLRANDOM_CONSUMER_SECRET']
      config.oauth_token = current_user.access_token
      config.oauth_token_secret = current_user.access_secret
    end

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
end
