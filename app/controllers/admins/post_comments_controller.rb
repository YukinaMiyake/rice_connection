class Admins::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to admins_post_path(params[:post_id]), alert: "コメントを削除しました"
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
  
  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = "ログインが必要です"
      redirect_to root_path
    end
  end
end

