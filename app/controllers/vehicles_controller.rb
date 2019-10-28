class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
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
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end
private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :awd, :storage_rack, :total_seats, :current_user)
  end
end
