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
    @foods = Food.all
    @dish = Dish.new
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :category)
  end
end
