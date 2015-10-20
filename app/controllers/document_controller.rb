class DocumentController < ApplicationController
  def update
    document = Document.find(params[:id])
    @job = document.job
    if document.update(document_params)
      redirect_to 'jobs/content_view',
                  notice: 'Document was successfully updated'
    else
      render @job
    end
  end

  private

  def document_params
    params.require(:document)
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
