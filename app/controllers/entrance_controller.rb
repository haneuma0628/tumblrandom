class EntranceController < ApplicationController
  layout "entrance"

  def index
    if user_signed_in? then
      redirect_to '/users/dashboard'
    end
  end
end
