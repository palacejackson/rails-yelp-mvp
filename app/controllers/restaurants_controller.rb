class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show update]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(resto_params)
    @restaurant.save
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.new(restaurant_id: params[:id])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def resto_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
