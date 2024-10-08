class Admins::OrdersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all
    #@consumer = @orders.map { |order| order.consumer }
    if params[:keyword].present?
      @orders = @orders.where('name LIKE ?', "%#{params[:keyword]}%").or(
                @orders.where(consumer_id: params[:keyword]))
      
    end
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
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end
