class Admins::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
    #if params[:keyword].present?
      #@posts = @posts.where('title LIKE ?', "%#{params[:keyword]}%").or(
               #@posts.where('body LIKE ?', "%#{params[:keyword]}%"))
    #end
    if params[:search_type] == 'post'
      @posts = @posts.where('title LIKE ?', "%#{params[:search_query]}%")
    elsif params[:search_type] == 'producer'
      @producers = Producer.where(last_name: params[:search_query]).or(
                   Producer.where(first_name: params[:search_query]))
      if @producers.present?
        @posts = @producers.first.posts
      end
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @producer = @post.producer
    @item = Item.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
    @producer = @post.producer
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿更新に成功しました"
      redirect_to admins_post_path(@post.id)
    else
      @producer = @post.producer
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :item_id)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end
