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
      redirect_to user_path(current_user.id)
    else
      flash[:notice] = 'Network not created successfully. Please try again.'
      render 'create'
    end


  end

  def show
    @all_networks = Network.all

  end

  def join
    @network = Network.find_by(id: params[:id])
    current_user.networks.push(@network)

    redirect_to user_path(current_user.id)
  end

private

  def network_params
    params.require(:network).permit(:user_id, :network_name)
  end
end
