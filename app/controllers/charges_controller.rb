class ChargesController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  before_action :require_user

  def index
    @charges = current_user.charges.charged_by_date
  end

  def show
    @charge = Charge.find(
      params[:id]
    )
    @groups_array = @charge.groups.grouped_by_charge
  end

  def new
    @charge = Charge.new
    @groups = Group.all
  end

  def create
    @charge = current_user.charges.build(charge_params)
    @group = Group.find_by(id: groups_params[:group_id])
    @charge.groups << @group unless @group.nil?

    if @charge.save
      flash[:primary] = 'Your charge has been created!'
      redirect_to charge_path(@charge)
    else
      flash[:danger] = 'Oops! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @charge = Charge.find(
      params[:id]
    )
    @groups = current_user.groups
  end

  def update
    @charge = Charge.find(
      params[:id]
    )
    @group = Group.find_by(id: groups_params[:group_id])
    if !@charge.groups.include?(@group)
      @charge.groups << @group unless @group.nil?
      @charge.update(charge_params)
      flash[:primary] = 'Charge has been updated'
      redirect_to charge_path(@charge)
    elsif @charge.groups.include?(@group)
      flash[:danger] = 'This group is already assigned to this charge!'
      redirect_to charge_path(@charge)
    else
      flash[:danger] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @charge = Charge.find(
      params[:id]
    )
    if @charge.destroy
      flash[:primary] = 'Charge has been deleted'
      redirect_to root_path
    end
  end
end
