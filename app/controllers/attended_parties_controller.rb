class AttendedPartiesController < ApplicationController
  def show
    @user = User.find(:user_id)
    @party = User.find(params[:party_id])
  end

  def index
    @user = User.find(params[:user_id])
    @attended_parties = @user.attended_parties
    @parties = @attended_parties.nonexpired_parties
    @old_parties = @attended_parties.old_parties
  end
end
