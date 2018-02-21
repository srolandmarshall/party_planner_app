class PartiesController < ApplicationController
  def index
    @hosted_parties = current_user.hosted_parties
    @attended_parties = current_user.attended_parties
    @parties = @attended_parties.nonexpired_parties
    @old_parties = @attended_parties.old_parties
  end

  def show
    @party = Party.find(params[:id])
    if @party.attendees.include?(current_user) || @party.host == current_user
      @host = @party.host
      @dishes = @party.dishes
      @foods = @party.foods
      @desserts = @dishes.desserts
      @entrees = @dishes.entrees
      @apps = @dishes.apps
    else
      flash[:notice]="You're not invited to this party"
      redirect_to root_path
    end
  end

  def new
    @user = current_user
    @users = Array.new(User.all)
    @users.delete(current_user)
    @party = Party.new
  end

  def create
    @user = current_user
    @party = Party.new(party_params)
    if @party
      pp=params[:party]
      @party.attendees = set_attendees(pp[:attendees])
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

  def edit
    @user = current_user
  end

  private

  def set_attendees(list)
    attendees = []
    list.each do |user|
      if user != ""
        attendees << User.find(user)
      end
    end
    attendees
  end

  def party_params
    params.require(:party).permit(:name, :address, :time, :host_id, :attendees)
  end

end
