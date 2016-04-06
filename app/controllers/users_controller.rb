class UsersController < ApplicationController
  layout 'users'

  # before_action :authenticate_user!, :get_app_info
  before_action :authenticate_user!

  def dashboard
    User.authenticate_tumblr_client

    @blogs = @client.info['user']['blogs']
    @selected_blog = @blogs[0]

    @cogs = {}
    @cogs['fetch_limit'] = 10
    fetch_limit = @cogs['fetch_limit']

    num_all_posts = @client.blog_info(@selected_blog['name'])['blog']['posts']
    all_posts_blocks = (num_all_posts.div(fetch_limit)).to_i
    random = Random.new
    fetch_offset = random.rand(0..all_posts_blocks)

    @posts = @client.posts(@selected_blog['name'], limit: fetch_limit, offset: fetch_offset)['posts']

    @page = fetch_offset
  end

  # def reload
  # end

  # def like
  # end

  # def settings
  # end

  # def select_view_blog
  # end

  # def select_action_blog
  # end
end
