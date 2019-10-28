class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
#current_user is not being assigned to vehicle.
    # binding.pry
    @vehicle = Vehicle.create(vehicle_params)
    redirect_to user_vehicles_path(current_user.id)
#question here is where do we want to redirect to. Back to user profile, to the vehicle index page, show page? Also, do we want to allow a user to include a photo of their vehicle as well?
  end

private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :awd, :storage_rack, :total_seats, :current_user)
  end
end
