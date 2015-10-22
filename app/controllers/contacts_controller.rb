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
    @contact.save!
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact was successfully updated"
      # redirect_to params[:success_redirect],
      #             notice: 'Job was successfully updated'
    else
      redirect_to params[:failure_redirect],
                  alert: 'There was a problem updating the contact'
    end
  end

  def destroy
    @contact.destroy
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
