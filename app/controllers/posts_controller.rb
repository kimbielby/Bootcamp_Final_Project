class PostsController < ApplicationController


  def new
  end


  def create
    @post = Post.new(post_params)
    @post.update(user_id: current_user.id)
    @post.save
    # binding.pry
    redirect_to user_path(current_user.id)
  end

  def show
    @comment = Comment.new  
    @selected_post = Post.find_by(id: params[:id])

  end

  def all_posts
    @posts = Post.all

  end

  def post_params
    params.require(:post).permit(:post_title, :post_date, :post_content, :user_id)
  end
end
