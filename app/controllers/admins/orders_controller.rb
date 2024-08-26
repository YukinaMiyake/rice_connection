class Admins::OrdersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
    
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admins_order_path(@order)
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:consumer_id, :postal_code, :address, :address, :name, :total_payment, :shipping_cost, :payment_method, :status)
  end
end
