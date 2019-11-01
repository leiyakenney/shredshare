class Trips::RidesController < ApplicationController

  def index
    @rides = current_user.rides
  end

  def create
    trip = Trip.find(params[:trip])
    user = current_user
    ride = Ride.create(user_id: user.id, trip_id: trip.id)
    if ride.save
      x = trip.seats_available - 1
      trip.update(seats_available: x)
      redirect_to my_rides_path
    else
      redirect_to trip_index_path
    end
  end


end
