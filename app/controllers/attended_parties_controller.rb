class AttendedPartiesController < ApplicationController
  def show
    @user = User.find(:user_id)
    @party = User.find(params[:party_id])
  end

  def index
    @user = User.find(params[:user_id])
    @parties = @user.attended_parties
  end
end
