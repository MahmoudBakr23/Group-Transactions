class GroupsController < ApplicationController
  include SessionsHelper 
  include ApplicationHelper
  before_action :require_user, only: %i[index]

  def index
    @all_groups = Group.all
    @groups = current_user.groups.order(id: :desc)
  end

  def show
    @group = Group.find(
    params[:id]
    )
    @charges = @group.charges.order(id: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:primary] = "Your group has been created!"
      redirect_to group_path(@group)
    else
      flash[:danger] = "Oops! Something went wrong!"
      render 'new'
    end
  end

  def edit
    @group = Group.find(
    params[:id]
    )
  end

  def update
    @group = Group.find(
    params[:id]
    )
    if @group.update(group_params)
      flash[:primary] = "Group has been updated"
      redirect_to group_path(@group)
    else
      flash[:danger] = "Something went wrong!"
      render 'new'
    end
  end

  def destroy
    @group = Group.find(
      params[:id]
      )
    if @group.destroy
      flash[:primary] = "Group has been deleted"
      redirect_to root_path
    end
  end
end