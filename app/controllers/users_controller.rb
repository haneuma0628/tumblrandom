require 'tumblr_client'

class UsersController < ApplicationController
  layout 'users'

  before_action :authenticate_user!, :authenticate_tumblr_client, :get_blog_info

  def dashboard
    random = Random.new
    @post = @client.posts(@selected_blog['name'], limit: 20, offset: 0)['posts'][random.rand(0..19)]
    # @post = {'type' => nil}
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

    @client = Tumblr::Client.new
  end

  def get_blog_info
    @blogs = @client.info['user']['blogs']
    @selected_blog = @blogs[0]
  end

end
