class Trips::RidesController < ApplicationController

  def create
    trip = Trip.find(params[:trip])
    user = current_user
    ride = Ride.create(user_id: user.id, trip_id: trip.id)
    if ride.save
      redirect_to my_rides_path
    else
      redirect_to trip_index_path
    end
  end


end
