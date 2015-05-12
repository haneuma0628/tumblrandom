class DashbordController < ApplicationController
  before_action :authenticate_user!, only: :view_random

  def reblog
  end

  def like
  end

  def view_random
  end

  def configure
  end

  def select_view_blog
  end

  def select_active_blog
  end
end
