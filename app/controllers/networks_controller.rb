class NetworksController < ApplicationController

  def index
  end

  def new
    @network = Network.new
  end

  def create
    @network = Network.new(network_params)
    if @network.save
      flash[:notice] = 'Network created successfully!'
      current_user.networks.push(@network)
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = 'Network not created successfully. Please try again.'
      render 'create'
    end


  end

  def show
    @all_networks = Network.all
  end

  def show_network_posts
    @network = Network.find(params[:id])
    @posts = @network.posts.all
  end

  def join
    @user_networks = current_user.networks
    @network = Network.find(params[:id])

    unless @user_networks.include?(@network)
      current_user.networks.push(@network)
      flash[:notice] = 'Network added successfully'
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = 'You are already a member of this network'
      redirect_to user_path(current_user.id)
    end
  end

  def leave
    @network = Network.find(params[:id])
    if @user_networks.include?(@network)
      current_user.networks.delete(@network)
      flash[:notice] = 'You have successfully left the network'
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = 'You are not a member of this network'
      redirect_to user_path(current_user.id)
    end

  end

private

  def network_params
    params.require(:network).permit(:user_id, :network_name)
  end
end
