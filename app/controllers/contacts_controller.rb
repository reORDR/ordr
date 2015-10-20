class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]
  before_action :set_job

  def index
    @contacts = @job.contacts
  end

  def show
  end

  def new
    @contact = @job.contacts.new
  end

  def edit
  end

  def create
    @contact = @job.contacts.new(contact_params)
    if @contact.save
      redirect_to [@job.job, @job], notice: "Contact added."
    # else
    #   instance_variable_set("@#{@resource.singularize}".to_sym, @job)
    #   render template: "#{@resource}/show"
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to [@job.job, @job], notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
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

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def contact_params
    params.require(:contact).permit(:name, :company, :phone, :email, :linkedin_url)
  end

end
