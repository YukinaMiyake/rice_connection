class Admins::GenresController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def new 
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "登録に成功しました"
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "情報更新に成功しました"
      redirect_to admins_genres_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path, alert: "投稿を削除しました"
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end
