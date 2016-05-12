class CommentsController < ApplicationController
  def create
    post = Post.find(comment_params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.update(user_id: current_user.id)
    @comment.save

  redirect_to post
  end

  def new
  end

  def show
  end


private

  def comment_params
    params.require(:comment).permit(:comment_content, :comment_date, :user_id, :post_id)
  end
end
