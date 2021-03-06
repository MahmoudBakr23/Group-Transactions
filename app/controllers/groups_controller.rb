class GroupsController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  before_action :require_user, only: %i[index]
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @all_groups = Group.all.grouped_by_date
    @groups = current_user.groups.grouped_by_date
  end

  def show
    @charges = @group.charges.charged_by_date
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:primary] = 'Your group has been created!'
      redirect_to group_path(@group)
    else
      flash[:danger] = 'Oops! Something went wrong!'
      render 'new'
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      flash[:primary] = 'Group has been updated'
      redirect_to group_path(@group)
    else
      flash[:danger] = 'Something went wrong!'
      render 'new'
    end
  end

  def destroy
    if @group.destroy
      flash[:primary] = 'Group has been deleted'
    else
      flash[:danger] = 'Group can not be deleted'
    end
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :image)
  end

  def set_group
    @group = Group.find(
      params[:id]
    )
  end
end
