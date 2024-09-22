class AddressesController < ApplicationController
  before_action :authenticate_consumer!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @address = Address.new
  end
  
  def create
    @address = current_consumer.addresses.build(address_params)
    if @address.save
      flash[:notice] = "配送先登録に成功しました"
      redirect_to addresses_path
    else
      render 'index'
    end
  end
  
  def index
    @address = Address.new
    @addresses =current_consumer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy 
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, alert: "配送先を削除しました"
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
  def authenticate_consumer!
    unless consumer_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
  
  def correct_user
    @address = current_consumer.addresses.find_by_id(params[:id])
    unless @address
      flash[:alert] = "編集権限がありません"
      redirect_to root_path 
    end
  end
end

