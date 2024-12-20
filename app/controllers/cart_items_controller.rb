class CartItemsController < ApplicationController
  before_action :authenticate_consumer!
  
  def index
    @cart_items = current_consumer.cart_items.all

  end
  
  def create
    #もし元々カート内に同じ商品がある場合、変更・保存
    if current_consumer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        #元々カート内にあるもの[:item_id]
        #今追加した　params[:cart_item][:item_id]
        @cart_item = current_consumer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        @cart_item.amount += params[:cart_item][:amount].to_i
        @cart_item.save
        redirect_to cart_items_path
      #もしカート内に同じ商品がない場合、通常の保存処理
    else
      @cart_item = current_consumer.cart_items.new(cart_item_params)
      if @cart_item.save
        @cart_items = current_consumer.cart_items.all
        render 'index'
      else
        @item = @cart_item.item
        @producer = @item.producer
        render 'items/show'
      end
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "数量を変更しました"
      redirect_to cart_items_path
    else
      @cart_items = current_consumer.cart_items.all
      render 'index'
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    render 'index'
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
