class PostsController < ApplicationController


  def new
  end

  def create
    @post = Post.new(post_params)

  end

  def post_params
    params.require(:post).permit(:post_title, :post_date, :post_content)
  end
end
