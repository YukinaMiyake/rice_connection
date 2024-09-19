class ConsumersController < ApplicationController
  before_action :authenticate_consumer!
  before_action :is_matching_login_consumer, only: [:edit, :update]
  
  def show
    @consumer = Consumer.find(params[:id])
    @producers = @consumer.producers
  end

  def edit
    @consumer = Consumer.find(params[:id])
  end
  
  def update
    @consumer = Consumer.find(params[:id])
    if @consumer.update(consumer_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to @consumer
    else
      render :edit
    end
  end
  
  def quit
    @consumer = Consumer.find(params[:id])
    if @consumer.id != current_consumer.id
      redirect_to root_path
    end
  end
  
  def withdraw
    @consumer = Consumer.find(current_consumer.id)
    @consumer.update(is_active: false)
    reset_session#セッション情報を全て削除
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end
  
  private
  
  def consumer_params
    params.require(:consumer).permit(:last_name, :first_name, :profile_image, :email, :postal_code, :address, :telephone_number)
  end
  
  def authenticate_consumer!
    unless consumer_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
  
  def is_matching_login_consumer
    if @consumer != current_consumer
      flash[:notice] = "ログインユーザーではないので編集できません"
      redirect_to consumer_path(current_consumer)
    end
  end
end
