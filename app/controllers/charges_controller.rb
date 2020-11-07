class ChargesController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  before_action :require_user
  before_action :set_charge, only: %i[show edit update destroy]

  def index
    @charges = current_user.charges.charged_by_date.select do |charge|
      next unless charge.groups.exists?

      charge.groups.each do |group|
        group.image if group.image.exists?
      end
    end
  end

  def show
    @groups_array = @charge.groups.grouped_by_charge_id
  end

  def new
    @charge = Charge.new
    @groups = Group.all.grouped_by_date
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
    @groups = Group.all.grouped_by_date
  end

  def update
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
    if @charge.destroy
      flash[:primary] = 'Charge has been deleted'
    else
      flash[:danger] = 'Charge can not be deleted!'
    end
    redirect_to root_path
  end

  private

  def charge_params
    params.require(:charge).permit(:name, :amount)
  end

  def groups_params
    params.require(:charge).permit(:group_id)
  end

  def set_charge
    @charge = Charge.find(
      params[:id]
    )
  end
end
