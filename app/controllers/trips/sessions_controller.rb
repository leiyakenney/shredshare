class Trips::SessionsController < ApplicationController

  def new
    @user = current_user
    sessons[:trip]
  end

  def finish_trip
    session.delete(:trip)
    redirect_to trip_lift_buddies_path
  end

end
