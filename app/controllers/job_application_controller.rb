class JobApplicationController < ApplicationController
  def update
    job_application = JobApplication.find(params[:id])
    if job_application.update(job_application_params)
      redirect_to params[:success_redirect],
                  notice: 'Job application was successfully updated'
    else
      redirect_to params[:failure_redirect],
                  alert: 'There was a problem updating the job application'
    end
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
