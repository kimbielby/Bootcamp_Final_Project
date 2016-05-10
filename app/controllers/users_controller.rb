require 'pry'

class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def landing_page
  end

  def new
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      redirect_to user_path
    else
      redirect_to new_user_registration_path
    end
  end

  def sign_up
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice] = 'You are not authorized to view this page'
      redirect_to '/'

    else
      @posts = Post.where(user_id: @user.id).page(1)
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
