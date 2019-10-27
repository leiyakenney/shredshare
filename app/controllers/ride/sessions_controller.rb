class Ride::SessionsController < ApplicationController

  def new
    @user = current_user
  end

end
