class Admins::ItemsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @producer = @item.producer
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
     @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to admins_item_path(@item.id)
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price, :stock)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end
