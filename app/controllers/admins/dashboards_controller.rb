class Admins::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    if params[:is_active]
    @producers = Producer.where(is_active :true)
    @consumers = Consumer.where(is_active :true)
    else
      @producers = Producer.all
      @consumers = Consumer.all
    end
  end
end
