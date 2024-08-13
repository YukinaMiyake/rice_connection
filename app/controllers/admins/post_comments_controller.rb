class Admins::PostCommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @post_comments = @post.post_comments
  end
end
