require 'tumblr_client'

class UsersController < ApplicationController
  layout 'users'

  before_action :authenticate_user!, :authenticate_tumblr_client, :get_blog_info

  def dashboard
    fetch_limit = 10
    num_all_posts = @client.blog_info(@selected_blog['name'])['blog']['posts']
    all_posts_blocks = (num_all_posts.div(fetch_limit)).to_i
    random = Random.new
    fetch_offset = random.rand(0..all_posts_blocks)

    @posts = @client.posts(@selected_blog['name'], limit: fetch_limit, offset: fetch_offset)['posts']
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
