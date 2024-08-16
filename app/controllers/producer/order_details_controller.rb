class Producer::OrderDetailsController < ApplicationController
  before_action :authenticate_producer!
  
  def index
    @order_details = current_producer.order_details.active_orders.includes(:item)
    @order_details = @order_details.where(status: params[:status]) if params[:status].present?
  end
  
  def show
    @order_detail = OrderDetail.find(params[:id])
  end
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:notice] = "status changes"
      redirect_back(fallback_location: root_url)
    else
      @item = @order_detail.item
      flash.now[:alert] = "failed"
      render :show
    end
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:status)
  end
end