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
    @comments = @selected_post.comments
    @current_user_posts = Post.where(user_id: current_user.id)

  end

  def edit
    @post = Post.find_by(id: params[:id])
    # @post.update(post_content: params[:post_content])

  end

  def update
  end

  def all_posts
    @posts = Post.all

  end

  def post_params
    params.require(:post).permit(:post_title, :post_date, :post_content, :user_id)
  end
end
