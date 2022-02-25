class ReviewsController < ApplicationController
  before_action :set_restaurant

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    # if @review.save
    #   redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}")
    # else
    #   render 'restaurants/show'
    # end
    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "restaurants/show" }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
