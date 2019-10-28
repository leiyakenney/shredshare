class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @user = current_user
    @vehicle = @user.vehicles.create(vehicle_params)
    if @vehicle.save
      redirect_to user_vehicles_path(current_user.id), notice: 'Vehicle Added.'
    else
      redirect_to new_user_vehicle_path(current_user.id), alert: 'Something went wrong. Please try again.'
    end
#question here is where do we want to redirect to. Back to user profile, to the vehicle index page, show page? Also, do we want to allow a user to include a photo of their vehicle as well?
  end

private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :awd, :storage_rack, :total_seats, :current_user)
  end
end
