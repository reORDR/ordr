class DocumentController < ApplicationController
  def update
    @job = Job.find(params[:job_id])
    @document = Document.find(params[:id])
    @document.update(document_params)
    @step = 'documents'
  end

  private

  def document_params
    params
      .require(:document)
      .permit(
        :resume,
        :cover_letter,
        :portfolio,
        :certifications,
        :references,
        :recommendations,
        :done
      )
  end
end
