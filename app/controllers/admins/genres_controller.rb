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
      render :new
    end
  end
  
  def index
    @genres = Genre.all
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
      render :edit
    end
  end

  def destroy
    
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
