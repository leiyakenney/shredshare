class VehiclesController < ApplicationController
  def new
    # user_id = params[:user_id].to_i
    # @user = User.find(user_id)
    @user = current_user
    binding.pry
    @vehicle = Vehicle.new
  end
end
