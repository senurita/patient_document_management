class DocumentsController < ApplicationController

  def list_documents
    role = UserType.find(current_user.user_type_id).name
    if role == "Doctor"
      @document = Document.where(:category => "Medical Record")
    else
      @document = Document.where(:category => "Prescription")
    end
    @requested_patients = RequestAccess.where(requestor_id: params[:user_id],grantor_id: params[:patient_id])
    if @requested_patients.blank?
      @documents_not_requested = @document.where('user_id = (?)',params[:patient_id])
    else
      @documents_not_requested = @document.where('user_id = (?) AND id NOT IN (?)', params[:user_id], @requested_patients.pluck(:document_id))
    end

  end

end