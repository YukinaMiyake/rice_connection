class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.consumer_id = current_consumer.id
    @post_comment.post_id = @post.id
    if @post_comment.save
      redirect_to post_path(@post.id)
    else
      @producer = @post.producer
      @item = @post.item
      render 'posts/show'
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
