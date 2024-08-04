class OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    if params [:order][:select_address] == "0"
      @order.postal_code = current_consumer.postal_code
      @order.address = current_consumer.address
      @order.name = current_consumer.name
    elsif params [:order][:select_address] = "1"
      
      
      
    end
  end
  
  def index
  end

  def show
  end
end
