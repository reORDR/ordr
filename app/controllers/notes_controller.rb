class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :destroy]
  before_action :load_notable

  def new
    @note = @notable.notes.build
  end

  def create
    @note = @notable.notes.build(note_params)
    if @note.save
      # drop-through to notes/create.js.erb
    else
      # instance_variable_set("@#{@resource.singularize}".to_sym, @notable)
      # render partial: "steps/#{@resource}", alert: "There was a problem saving your note."
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      # drop-through to notes/update.js.erb
    else
    end
  end

  def destroy
    @note.destroy
    # format.html { redirect_to [@notable.job, @notable], notice: "note was successfully deleted."}
    #   format.json {head :no_content }
    # end
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

  def load_notable
    @resource, id = request.path.split('/')[1..2]
    @notable = @resource.singularize.classify.constantize.find(id)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
