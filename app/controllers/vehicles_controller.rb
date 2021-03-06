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

  def update
    vehicle = Vehicle.find(params[:id])
    if vehicle.update(vehicle_params)
      redirect_to user_vehicle_path(user_id: current_user.id, id: vehicle.id), notice: 'Vehicle Updated.'
    else
      render :edit, alert: 'Something went wrong. Please try again.'
    end
  end

  def destroy
    vehicle = Vehicle.find(params[:id])
    if vehicle.destroy && (current_user.vehicles.count == 0)
      redirect_to profile_path, notice: 'Vehicle was removed.'
    elsif vehicle.destroy && (current_user.vehicles.count >= 1)
      redirect_to user_vehicles_path(current_user.id), notice: 'Vehicle was removed.'
    else
      redirect_to user_vehicles_path(current_user.id), alert: 'Something went wrong. Please try again.'
    end
  end
private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :awd, :storage_rack, :total_seats, :current_user)
  end

end
