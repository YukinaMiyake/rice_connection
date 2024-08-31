class Admins::ConsumersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def show
    @consumer = Consumer.find(params[:id])
  end
  
  def edit
    @consumer = Consumer.find(params[:id])
  end
  
  def update
    @consumer = Consumer.find(params[:id])
    if @consumer.update(consumer_params)
      admins_consumer_path(@consumer)
    else
      flash[:notice]="項目を正しく記入してください"
      render 'edit'
    end
  end
  
  private
  def consumer_params
    params.require(:producer).permit(:first_name, :last_name, :email, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
