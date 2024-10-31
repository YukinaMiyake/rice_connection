class Consumer::OrdersController < ApplicationController
  before_action :authenticate_consumer!
  
  def new
    @order = Order.new
    @addresses = Address.all
    @consumer = current_consumer
  end

  def confirm
    @order = current_consumer.orders.build(order_params)
    @consumer = current_consumer
    if params[:order]["select_address"] == "0"
      @order.postal_code = current_consumer.postal_code
      @order.address = current_consumer.address
      @order.name = current_consumer.name
    elsif params[:order]["select_address"] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order]["select_address"] == "2"
      #@order.consumer_id = current_consumer.id
    end
      @cart_items = current_consumer.cart_items
      @order_new = Order.new
    if @order.valid?
      render :confirm    
    else
      @addresses = Address.all
      if params[:order]["select_address"] != "2"
        @order.postal_code = nil
        @order.address = nil
        @order.name = nil
      end
      render :new
    end
  end
  
  def create
    @order = current_consumer.orders.build(order_params)
    @order.save!
    @cart_items = current_consumer.cart_items.all

    @cart_items.each do |cart_item| 
      @order_details = OrderDetail.new
      @order_details.order_id = @order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      #@order_details.weight = cart_item.weight
      @order_details.save!
    end
    
    CartItem.destroy_all
    redirect_to thanks_consumer_order_path(@order)
  end
  
  def thanks
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    
  end
  
  def index
    @orders = Order.where(consumer_id: current_consumer.id)
  end

  def show
    @order = Order.find(params[:id])
    unless @order.consumer == current_consumer
      redirect_to consumer_path(current_consumer)
    end
    @order_details = @order.order_details
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :total_payment, :shipping_cost, :payment_method, :status)
  end
  
  def cart_item_nill
    cart_items = current_consumer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
    end
  end
  
  def authenticate_consumer!
    unless consumer_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
  
end
