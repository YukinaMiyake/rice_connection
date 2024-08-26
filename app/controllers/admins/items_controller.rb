class Admins::ItemsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
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
      render :edit
    end
  end
end
