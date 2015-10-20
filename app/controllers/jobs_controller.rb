class JobsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_job, except: [:index, :new, :create, :deleted_index]

  def index
    @jobs = Job.where(user: current_user)
  end

  def show
  end

  def new
    @job = Job.new(user: current_user)
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.document = Document.new
    @job.job_application = JobApplication.new
    @job.interview = Interview.new
    @job.network = Network.new
    @job.create_research
    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      #FIXME update success should render step
      render 'jobs/content_view', notice: 'Job was successfully updated.', locals: {step: params[:step]}
    else
      render :edit
    end
  end

  def destroy
    #TODO notice should not report destroyed if archived
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  def content
    render 'jobs/content_view', locals: {step: params[:step]}
  end

  def content_edit
    render 'jobs/content_edit', locals: {step: params[:step]}
  end

  def deleted_index
    #TODO clicking on job list items crashes app
    @jobs = Job.deleted.where(user: current_user).to_a
    render "jobs/index"
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit!
  end
end
