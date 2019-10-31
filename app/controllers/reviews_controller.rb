class ReviewsController<ApplicationController
  before_action :set_user

  def set_user
    @user = User.find(params[:user_id])
  end

  def new
    @review = @user.reviews.new
  end
end
