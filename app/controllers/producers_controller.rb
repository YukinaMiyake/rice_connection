class ProducersController < ApplicationController
  before_action :authenticate_producer!
  before_action :is_matching_login_producer, only: [:edit, :update]
  
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
  
  def quit
    @producer = Producer.find(params[:id])
    if @producer.id != current_producer.id
      redirect_to root_path
    end
  end
  
  def withdraw
    @producer = Producer.find(current_producer.id)
    @producer.update(is_active: false)
    reset_session#セッション情報を全て削除
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end
  
  private
  
  def producer_params
    params.require(:producer).permit(:last_name, :first_name, :profile_image, :email, :postal_code, :address, :telephone_number)
  end
  
  def authenticate_producer!
    unless producer_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
  
  def is_matching_login_producer
    producer = Producer.find(params[:id])
    unless producer.id == current_producer.id
      flash[:notice] = "ログインユーザーではないので編集できません"
      redirect_to producer_path(current_producer)
    end
  end
end
