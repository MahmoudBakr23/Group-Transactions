class UsersController < ApplicationController
  include UsersHelper
  include SessionsHelper

  def show
    @user = User.find(
      params[:id]
    )
  end

  def new
    @user = User.new
    user_check
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:primary] = 'You have signed up successfully'
      redirect_to root_path
    elsif User.exists?(name: @user.name)
      flash[:danger] = 'This name has been taken!'
      render 'new'
    else
      flash[:danger] = 'Oops! Something went wrong!'
      render 'new'
    end
  end

  def destroy
    @user = User.find(
      params[:id]
    )
    if @user.destroy
      flash[:info] = "We're sad you're leaving :'("
    else
      flash[:danger] = 'Something went wrong! Please try again'
    end
    redirect_to root_path
  end
end
