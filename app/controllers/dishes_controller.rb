class DishesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @dishes = @user.dishes
    @desserts = @dishes.desserts
    @entrees = @dishes.entrees
    @apps = @dishes.apps
  end

  def new
    @party = Party.find(params[:party_id])
    @dish = Dish.new
  end
end
