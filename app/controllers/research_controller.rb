class ResearchController < ApplicationController
  def update
    research = Research.find(params[:id])
    if research.update(research_params)
      redirect_to params[:success_redirect],
                  notice: 'Research was successfully updated'
    else
      redirect_to params[:failure_redirect],
                  alert: 'There was a problem updating the research'
    end
  end

  private

  def research_params
    #              below used to be :jobs
    params.require(:research).permit(research_attributes:[:company_mission, :company_goals, :current_projects])
  end
end
