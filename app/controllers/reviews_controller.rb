class ReviewsController < ApplicationController
  before_action :set_itinerary
  before_action :logged_in_user, only: [:new, :create]

  def index
    @reviews = Review.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

#should not be able to add review to your own itinerary
  def create
    @review = current_user.reviews.build(review_params)
    @review.user_id = current_user.id
    @review.itinerary_id = @itinerary.id

    if @review.save
      flash[:success] = "Your review has been added!"
      #should redirect back to the itinerary
      redirect_to @itinerary
    else
    #  flash[:error] = @review.errors.full_messages
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
    @review = @itinerary.reviews.find(params[:id])
    @review.destroy
    redirect_to @itinerary
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
