class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = PostComment.new(post_comment_params)
    comment.consumer_id = current_consumer.id
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
  end
  
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to post_path(post.id)
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
