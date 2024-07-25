class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @producers = Producer.all
    @consumers = Consumer.all
  end
end
