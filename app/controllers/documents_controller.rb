class DocumentsController < ApplicationController

  def list_documents
      user_type_id = current_user.user_type_id
    if user_type_id == USER_MAPPING[1][:id]
      @document = Document.where(:category => RECORD_CATEGORY[0])
    else
      @document = Document.where(:category => RECORD_CATEGORY[1])
    end
    @requested_patients = RequestAccess.where(requestor_id: params[:user_id],grantor_id: params[:patient_id])
    if @requested_patients.blank?
      @documents_not_requested = @document.where('user_id = (?)',params[:patient_id])
    else
      @documents_not_requested = @document.where('user_id = (?) AND id NOT IN (?)', params[:user_id], @requested_patients.pluck(:document_id))
    end

  end

end