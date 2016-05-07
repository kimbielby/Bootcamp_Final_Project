class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def landing_page
  end

  def new
  end

  def sign_up
  end

  def show
    @user = User.find(params[:id])
  end
end
