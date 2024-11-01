class Admins::ProducersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def show
    @producer = Producer.find(params[:id])
    @order_details = @producer.order_details
  end
  
  def edit
    @producer = Producer.find(params[:id])
  end
  
  def update
    @producer = Producer.find(params[:id])
    if @producer.update(producer_params)
      flash[:notice] = "情報を更新しました"
      redirect_to admins_producer_path(@producer)
    else
      flash[:notice]="項目を正しく記入してください"
      render :edit
    end
  end
  
  private
  def producer_params
    params.require(:producer).permit(:first_name, :last_name, :email, :postal_code, :address, :telephone_number, :email, :is_active)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end
