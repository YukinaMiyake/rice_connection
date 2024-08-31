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
    
    if params[:producer_keyword].present?
      @producers = @producers.where('last_name LIKE ?', "%#{params[:producer_keyword]}%").or(
                   @producers.where('first_name LIKE ?', "%#{params[:producer_keyword]}%")).or(
                   @producers.where('id LIKE ?', "%#{params[:producer_keyword]}%"))
                   
    end
    
    if params[:producer_status].present?
      @producers = @producers.where(is_active: params[:producer_status])
    end
    
    if params[:consumer_keyword].present?
      @consumers = @consumers.where('last_name LIKE ?', "%#{params[:consumer_keyword]}%").or(
                   @consumers.where('first_name LIKE ?', "%#{params[:consumer_keyword]}%")).or(
                   @consumers.where('id LIKE ?', "%#{params[:consumer_keyword]}%"))
    end
    
    if params[:consumer_status].present?
      @consumers = @consumers.where(is_active: params[:consumer_status])
    end
  end
end
