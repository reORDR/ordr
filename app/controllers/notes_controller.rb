class NotesController < ApplicationController
  before_action :set_note, only: [:update, :destroy]
  before_action :load_notable

  def index
    @notes = @notable.notes
  end

  def new
    @note = @notable.notes.build
  end

  def create
    @note = @notable.notes.new(note_params)
    if @note.save
      redirect_to [@notable.job, @notable], notice: "note added."
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @notable)
      render template: "#{@resource}/show"
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to [@notable.job, @notable], notice: 'note was successfully updated.' }
        format.json { render :show, status: :ok, location: @notable }
      else
        format.html { render :edit }
        format.json { render json: @notable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to [@notable.job, @notable], notice: "note was successfully deleted."}
      format.json {head :no_content }
    end
  end

  private

  def load_notable
    resource, id = request.path.split('/')[1..2]
    @notable = resource.singularize.classify.constantize.find(id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
