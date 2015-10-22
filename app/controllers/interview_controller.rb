class InterviewController < ApplicationController
  def update
    @job = Job.find(params[:job_id])
    @interview = Interview.find(params[:id])
    @interview.update(interview_params)
    @step = 'interview'
  end

  private

  def interview_params
    params
      .require(:interview)
      .permit(
        :format,
        :date,
        :thank_you
      )
  end
end
