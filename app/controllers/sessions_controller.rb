class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(name: params[:sessions][:name])
    if user
      log_in(user)
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
