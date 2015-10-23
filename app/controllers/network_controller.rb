class NetworkController < ApplicationController
  before_action :get_step

  def update
    @job = Job.find(params[:job_id])
    @network = Network.find(params[:id])
    @network.update(network_params)
  end

  private

  def get_step
    @step = 'networking'
  end

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
