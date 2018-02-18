class PartiesController < ApplicationController
  def index
    @parties = Party.nonexpired_parties
    @old_parties = Party.old_parties
  end

  def show
    @party = Party.find(params[:id])
    @host = @party.host
    @dishes = @party.dishes
    @foods = @party.foods
    @desserts = @dishes.desserts
    @entrees = @dishes.entrees
    @apps = @dishes.apps
  end

  def new
    @user = current_user
    @party = Party.new
  end

  def create
    @user = current_user
    @party = Party.new()
    if @party
      pp=params[:party]
      @party.name = pp[:name]
      @party.address = pp[:address]
      @party.host = @user
      @party.time = DateTime.civil(pp["time(1i)"].to_i,pp["time(2i)"].to_i,pp["time(3i)"].to_i,pp["time(4i)"].to_i,pp["time(5i)"].to_i)
      @party.save
      flash[:notice] = "Party created"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Party unable to be created"
      redirect_to user_path(@user)
    end
  end

  private

  def party_params
    params.require(:party).permit(:name, :address, :time, :host_id)
  end

end
