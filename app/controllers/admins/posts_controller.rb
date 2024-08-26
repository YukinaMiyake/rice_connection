class Admins::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @posts = Post.all
    if params[:keyword].present?
      @posts = @posts.where('title LIKE ?', "%#{params[:keyword]}%").or(
               @posts.where('body LIKE ?', "%#{params[:keyword]}%"))
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @producer = @post.producer
    @item = Item.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
end
