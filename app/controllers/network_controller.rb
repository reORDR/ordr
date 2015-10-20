class NetworkController < ApplicationController
  def update
    network = Network.find(params[:id])
    if network.update(network_params)
      redirect_to params[:success_redirect],
                  notice: 'Network was successfully updated'
    else
      redirect_to params[:failure_redirect],
                  alert: 'There was a problem updating the network'
    end
  end

  private

  def network_params
    params
      .require(:network)
      .permit(
        :date,
        :plans,
        :done
      )
  end
end
