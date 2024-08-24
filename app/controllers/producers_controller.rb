class ProducersController < ApplicationController
  
  def show
    @producer = Producer.find(params[:id])
    @posts = @producer.posts
  end

  def edit
    @producer = Producer.find(params[:id])
  end
  
  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to producer_path(@producer.id)
    else
      render :edit
    end
  end
  
  private
  
  def producer_params
    params.require(:producer).permit(:name, :profile_image, :email, :postal_code, :address, :telephone_number)
  end
end
