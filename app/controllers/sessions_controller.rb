class SessionsController < ApplicationController
  def new
    @user=User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
      flash[:notice]="Unable to find #{params[:user][:name]}."
    end
  end

  def destroy
    reset_session
    redirect_to root_path
    flash[:notice] = "Logged out."
  end
end
