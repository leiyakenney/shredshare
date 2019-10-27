class Ride::SessionsController < ApplicationController

  def new
    @user = current_user
    sessons[:trip]
  end

end
