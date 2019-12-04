class ReviewsController<ApplicationController
  before_action :set_user

  def set_user
    @user = User.find(params[:user_id])
  end

  def new
    @review = @user.reviews.new
  end

  def create
    @review = @user.reviews.create(review_params)
    if @review.save
      redirect_to "/users/#{@user.id}", notice: 'You have successfully reviewed this lift buddy!'
    else
      redirect_to new_user_review_path(@user), alert: "Please fill in all fields in order to create a review."
    end

    def edit
# binding.pry
      @review = @user.reviews.find_by(params[:user_id])
    end

  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :id, :user_id)
  end
end
