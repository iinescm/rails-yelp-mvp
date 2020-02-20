class ReviewsController < ApplicationController
  before_action :fetch_restaurant

  def index
  @reviews = Review.all
  end

  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
      # "restaurants/show"
    end
  end

  def edit
   # @restaurant = Restaurant.find(params[:id])
  end

  def update
   # @restaurant = Restaurant.find(params[:id])
    if @review.update(review_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def fetch_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
