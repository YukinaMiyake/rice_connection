class CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def index
    @cart_items = current_consumer.cart_items
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
