class ConsumersController < ApplicationController
  
  def show
    @consumer = Consumer.find(params[:id])
  end

  def edit
    @consumer = Consumer.find(params[:id])
  end
  
  def update
    @consumer = Consumer.find(params[:id])
    if @consumer.update(consumer_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to consumer.find(params[:id])
    else
      render :edit
    end
  end
  
  private
  
  def consumer_params
    params.require(:consumer).permit(:name, :profile_image, :email, :postal_code, :address, :telephone_number)
  end
end
