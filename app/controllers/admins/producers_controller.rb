class Admins::ProducersController < ApplicationController
  def index
    if params[:is_active]
      producer = Producer.where(is_valid: true)
      @producers = producer.page(params[:page])
    else
      @producers = Producer.page(params[:page])
    end
  end
  
  def show
    @producer = Producer.find(params[:id])
  end
  
  def edit
    @producer = Producer.find(params[:id])
  end
  
  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      admins_producer_path(@producer)
    else
      flash[:notice]="項目を正しく記入してください"
      render 'edit'
    end
  end
  
  private
  def producer_params
    params.require(:producer).permit(:first_name, :last_name, :email, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
