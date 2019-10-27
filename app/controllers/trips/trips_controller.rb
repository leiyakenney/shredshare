class Trips::TripsController < ApplicationController

  def new
    Trip.build
    session[:trip]
  end

  def create

  end

end
