class DocumentsController < ApplicationController

  def list_documents
    @requested_patients, @documents_not_requested = Document.show_documents(current_user, current_user.user_type_id,params[:patient_id])
  end

end