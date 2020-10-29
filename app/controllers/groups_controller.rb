class GroupsController < ApplicationController
  include SessionsHelper 
  include ApplicationHelper
  before_action :require_user

  def index
    @groups = current_user.groups.order(id: :desc)
  end

  def show
    @group = Group.find(
    params[:id]
    )
    @charges = @group.charges
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
  end

  def update
  end

  def destroy
  end
end
