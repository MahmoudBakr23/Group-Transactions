class SessionsController < ApplicationController
  include SessionsHelper

  def new
    user_check
  end

  def create
    user = User.find_by(name: params[:sessions][:name])
    if user
      log_in(user)
      flash[:notice] = "You have logged in successfully"
      redirect_to root_path
    else
      flash[:alert] = "Oops! Something went wrong!"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = "You have logged out successfully!"
    redirect_to root_path
  end

end
