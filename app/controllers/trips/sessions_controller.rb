class Trips::SessionsController < ApplicationController

  def new
    @user = current_user
    sessons[:trip]
  end

  def finish_trip
    session.delete(:trip)
    redirect_to lift_buddy_index_path
  end

end
