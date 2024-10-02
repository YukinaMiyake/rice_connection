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
      flash[:notice] = "情報を更新しました"
      admins_consumer_path(@consumer)
    else
      flash[:alert]="更新に失敗しました"
      render 'edit'
    end
  end
  
  private
  def consumer_params
    params.require(:consumer).permit(:first_name, :last_name, :email, :postal_code, :address, :telephone_number, :email, :is_active)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end
