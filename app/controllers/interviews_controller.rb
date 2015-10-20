class InterviewsController < ApplicationController
  def update
    interview = Interview.find(params[:id])
    if interview.update(interview_params)
      redirect_to params[:success_redirect],
                  notice: 'Document was successfully updated'
    else
      redirect_to params[:failure_redirect],
                  alert: 'There was a problem updating the interview'
    end
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
