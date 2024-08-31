class AddressesController < ApplicationController
  
  def new
    @address = Address.new
  end
  
  def create
    @address = current_consumer.addresses.build(address_params)
    if @address.save
      flash[:notice] = "配送先登録に成功しました"
      redirect_to addresses_path
    else
      @addresses = Address.all
      render 'index'
    end
  end
  
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end
  
  def update
  
  end
  
  def destroy 
    
  end
  
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end

