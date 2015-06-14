require "tumblr_client"

class UsersController < ApplicationController
  layout "users"

  before_action :authenticate_user!, :authenticate_tumblr_client

  def dashboard
    @blogs = @client.info['user']['blogs']
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
      config.consumer_key = ENV["TUMBLRANDOM_CONSUMER_KEY"]
      config.consumer_secret = ENV["TUMBLRANDOM_CONSUMER_SECRET"]
      config.oauth_token = current_user.access_token
      config.oauth_token_secret = current_user.access_secret
    end

    @client = Tumblr::Client.new
  end

end
