class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]

  # def new
  #   @review = Review.new
  # end

  def create
    @review = @restaurant.reviews.new(review_params)
    # @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
