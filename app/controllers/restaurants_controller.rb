class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]

  def top
    @restaurants = Restaurant.where(stars: 5)
  end

  def index
    @restaurants = Restaurant.all
  end

  def chef
    @chef_name = @restaurant.chef
  end

  def show
    @reviews = @restaurant.reviews
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy
    @restaurant.destroy
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :stars)
  end
end
