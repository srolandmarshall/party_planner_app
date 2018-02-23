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

  def create
    @user = current_user
    @party = Party.find(params[:id])
    if params[:commit] == "Add Dish"
      @dish = Dish.create(food_id: params[:food_id], user_id: @user.id, party_id: @party.id)
      flash[:notice] = "Dish added!"
      redirect_to party_path(Party.find(params[:id]))
    elsif params[:commit] == "Create and Add Dish"
      @food = Food.create(name: params[:food][:name], category: params[:category])
      @dish = Dish.create(food_id: @food.id, user_id: @user.id, party_id: @party.id)
      flash[:notice] = "Dish created and Added!"
      redirect_to party_path(Party.find(params[:id]))
    else
      flash[:notice] = "There was some sort of error..."
      redirect_to new_party_dish_path(@party)
    end
  end

  def delete
  end

  def destroy
    @party = Party.find(params[:id])
    @dish = Dish.find(params[:dish_id])
    @dish.destroy
    flash[:notice] = "Dish Removed."
    redirect_to party_path(@party)
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :category)
  end
end
