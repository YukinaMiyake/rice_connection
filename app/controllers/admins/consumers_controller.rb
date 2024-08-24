class Admins::ConsumersController < ApplicationController
  def index 
    if params[:is_active]
      consumer = Consumer.where(is_valid: true)
      @consumers = consumer.page(params[:page])
    else
      @consumers =Consumer.page(params[:page])
    end
  end
  
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
end
