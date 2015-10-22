class ResearchController < ApplicationController
  def update
    @job = Job.find(params[:job_id])
    @research = Research.find(params[:id])
    @research.update(research_params)
    @step = 'research'
  end

  private

  def research_params
    params
      .require(:research)
      .permit(
        :company_mission,
        :current_projects,
        :company_goals,
        :done
      )
  end
end

