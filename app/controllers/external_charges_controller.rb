class ExternalChargesController < ApplicationController
  include SessionsHelper 
  include ApplicationHelper
  before_action :require_user

  def index
  end
end
