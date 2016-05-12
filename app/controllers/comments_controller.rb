class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.update(user_id: current_user.id)
    @comment.save

redirect_to all_posts_path 
  end

  def new

  end


private

  def comment_params
    params.require(:comment).permit(:comment_content, :comment_date, :user_id)
  end
end
