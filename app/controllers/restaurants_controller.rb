class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/:id
  def show
    @review = Review.new
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /restaurants/:id/edit
  def edit
  end

  # PATCH /restaurants/:id
  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: "Restaurant was successfully destroyed."
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
