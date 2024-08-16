class Producer::OrdersController < ApplicationController
  def index
    @orders = Order.active_orders.includes(order_details: :item).where('items.producer_id': current_producer.id)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item).where('items.producer_id': current_producer.id)
  end
end