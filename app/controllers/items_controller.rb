class ItemsController < ApplicationController
  before_action :authenticate_producer!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
      @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.producer_id = current_producer.id
    if @item.save
      flash[:notice] = "商品登録に成功しました"
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def index
    if current_producer
      @items = current_producer.items
    else
      @items = Item.all
    end
    if params[:keyword].present?
      @items = @items.where('name LIKE ?', "%#{params[:keyword]}%").or(
               @items.where('introduction LIKE ?', "%#{params[:keyword]}%"))
    end
    @items = @items.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    if params[:order].present?
      col, order = params[:order].split("__").map(&:to_sym)
      @items = @items.order(col => order)
    else
      @items = @items.order(created_at: :desc)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to item_path(@item.id)
    else
      render :edit
    end
    
    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to items_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :stock)
  end
  
  def correct_user
    @item = current_producer.items.find_by_id(params[:id])
    redirect_to root_path unless @item
  end
end
