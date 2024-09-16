class PostsController < ApplicationController
  before_action :is_matching_login_producer, only: [:edit, :update]
  before_action :authenticate_producer!, only: [:new, :edit, :update, :destroy]
  
  def new 
    @post = Post.new
    @producer = current_producer
  end
  
  def create
    @post = Post.new(post_params)
    @post.producer_id = current_producer.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post.id)
    else
      @producer = current_producer
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end
  
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
    @post_comment = PostComment.new
  end
  
  def edit
    @post = Post.find(params[:id])
    @producer = current_producer
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿更新に成功しました"
      redirect_to post_path(@post.id)
    else
      @producer = current_producer
      flash.now[:alert] = "投稿に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to producer_path(current_producer.id)
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :item_id)
  end
  
  def is_matching_login_producer
    post = Post.find(params[:id])
    if current_producer != post.producer
      flash[:notice] = "ログインユーザーではないので編集できません"
      redirect_to posts_path
    end
  end
  
  def authenticate_producer!
    unless producer_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end


end
