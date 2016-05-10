class MySessionsController < Devise::SessionsController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
