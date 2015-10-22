class JobApplicationController < ApplicationController
  def update
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:id])
    @job_application.update(job_application_params)
    @step = 'apply'
  end

  private

  def job_application_params
    params
      .require(:job_application)
      .permit(
        :date,
        :sent
      )
  end
end
