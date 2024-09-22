class HomesController < ApplicationController
  def top
    if current_consumer
      redirect_to items_path
    elsif current_producer
      redirect_to producer_path(current_producer)
    elsif current_admin
      redirect_to admins_root_path
    else
      redirect_to root_path
    end
  end
end

