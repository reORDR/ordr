class ContactsController < ApplicationController
  before_action :set_job
  before_action :set_contact, only: [:show, :edit, :update, :destroy]


  def index
    @contacts = @job.contacts
  end

  def show
    render @contact
    # render 'jobs/content_view_contacts'
  end

  def new
    @contact = @job.contacts.new
  end

  def edit
  end

  def create
    @contact = @job.contacts.new(contact_params)
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to params[:success_redirect], notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @job.contacts }
      else
        format.html { redirect_to params[:failure_redirect], alert: 'There was a problem updating the document' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to [@job.job, @job], notice: "Contact was successfully deleted."}
      format.json {head :no_content }
    end
  end

  private

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_contact
    @contact = @job.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :company, :phone, :email, :linkedin_url, :job_id)
  end

end
