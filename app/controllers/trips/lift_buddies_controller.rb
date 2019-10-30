class Trips::LiftBuddiesController < ApplicationController
  def index
    @trip = current_trip
  end

end
