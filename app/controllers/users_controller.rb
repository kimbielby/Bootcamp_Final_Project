class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def landing_page
  end

  def new
  end

  def create
    @user = User.new(user_params)
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
    render 'users/show'
  end

  private

  def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
