require 'logger'

class EntranceController < ApplicationController
  layout "entrance"

  def index
    @info = "please, sign in."
    if user_signed_in? then
      redirect_to '/tumblrandom/entrance/tmp'
    end
  end

  def tmp
    User.authenticate_tumblr_client

    logger.debug(@client)
  end
end
