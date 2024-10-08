class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = PostComment.new(post_comment_params)
    comment.consumer_id = current_consumer.id
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post.id)
    else
      flash[:alert] = "コメントを入力してください"
    end
  end
  
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to post_path(params[:post_id]), alert: "コメントを削除しました"
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
