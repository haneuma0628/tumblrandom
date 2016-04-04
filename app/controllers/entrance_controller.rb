class EntranceController < ApplicationController
  layout "entrance"

  def index
    @info = "please, sign in."
    if user_signed_in? then
      redirect_to '/users/dashboard'
    end
  end
end
