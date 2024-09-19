class RelationshipsController < ApplicationController
  before_action :authenticate_consumer!
  
  def create
    @producer = Producer.find(params[:producer_id])
    current_consumer.follow(@producer)
    redirect_back(fallback_location: root_url)
  end
  
  def destroy
    @producer = Producer.find(params[:producer_id])
    current_consumer.unfollow(@producer)
    redirect_back(fallback_location: root_url)
  end
end