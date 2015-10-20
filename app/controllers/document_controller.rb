class DocumentController < ApplicationController
  def update
    document = Document.find(params[:id])
    if document.update(document_params)
      redirect_to params[:success_redirect],
                  notice: 'Document was successfully updated'
    else
      redirect_to params[:failure_redirect],
                  alert: 'There was a problem updating the document'
    end
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
