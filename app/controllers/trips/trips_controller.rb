class Trips::TripsController < ApplicationController

  def new
    @current_user = current_user
  end

  # date_of_departure is concatinated here from the day, month and year given
  # only valid dates are accepted to successfully create a trip
  # if a date is invalid, the user is prompted with a message letting them know
  # and they are redirected to the :new page to continue filling out the form.
  def create
    @user = current_user
    @rtd_location = RtdLocation.where(name: params[:rtd_location_id]).first.id
    @vehicle = current_user.vehicles.where(model: params[:vehicle_id].split.last, make: params[:vehicle_id].split.first).first.id
    @date_of_departure = "#{params[:month_of_trip]} #{params[:day_of_trip]} #{params[:year_of_trip]}"
    @trip = Trip.create(user_id: @user.id, vehicle_id: @vehicle, rtd_location_id: @rtd_location, date_of_departure: @date_of_departure, seats_available: params[:seats_available], destination_point: params[:destination_point], ride_type: params[:ride_type])
    if @trip.save
      "Get ready to send! Your trip is created!"
      redirect_to trip_show_path(@trip.id)
    else
      "Sorry jerry! Try it again!"
      @current_user = current_user
      render :new
    end
  end


  def show
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  def edit
    @user = current_user
    @trip = Trip.find(params[:id])
  end

  # A future ice box idea would be to send an email letting passengers
  # know that this trip has been changed and giving them the option to cancel
  # their participation from the email.
  def update
    @user = current_user
    @trip = Trip.find(params[:format])
    rtu = params[:ride_type]
    rtdlu = params[:rtd_location_id]
    sau = params[:seats_available]
    dpu = params[:destination_point]
    if rtu.length > 2
      @trip.update(ride_type: rtu)
    end
    if rtdlu != 0 || nil
      @trip.update(rtd_location_id: rtdlu)
    end
    if sau != nil || " "
      @trip.update(seats_available: sau)
    end
    if dpu.length > 2
      @trip.update(destination_point: dpu)
    end
    if @trip.save
      redirect_to trip_show_path(@trip)
    else
      @trip = @trip
      render :edit
    end
  end

  # A future ice box idea would be to send an email letting passengers
  # know the trip has been canceled and the driver who created the trip
  # could lose reputaiton points on their review score for being flaky.
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to root_path
  end

end
