class ChargesController < ApplicationController
  include SessionsHelper 
  include ApplicationHelper
  before_action :require_user

  def index
    @charges = Charge.all.order(id: :desc)
  end

  def show
    @charge = Charge.find(
    params[:id]
    )
    @groups = @charge.groups
  end

  def new
    @charge = Charge.new
    @groups = current_user.groups
  end

  def create
    @charge = current_user.charges.build(charge_params)
    @group = Group.find_by(id: groups_params[:group_id])
    @charge.groups << @group

    if @charge.save
      flash[:primary] = "Your charge has been created!"
      redirect_to charge_path(@charge)
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
