class Trips::PassengerController < ApplicationController

  def index
    @trips = Trip.where("seats_available > 0")
  end


end
