class NetworkController < ApplicationController
  def update
    @job = Job.find(params[:job_id])
    @network = Network.find(params[:id])
    @network.update(network_params)
    @step = 'network'
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
