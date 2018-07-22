class Document < ApplicationRecord
	belongs_to :user, :foreign_key => 'user_id'
	has_many :request_accesses, dependent: :destroy


  def self.show_documents(user_id,user_type_id,patient_id)
    if user_type_id == USER_MAPPING[1][:id]
      @document = Document.where(:category => RECORD_CATEGORY[0])
    elsif user_type_id == USER_MAPPING[3][:id]
      @document = Document.where(:category => RECORD_CATEGORY[1])
    end
    @requested_patients = RequestAccess.where(requestor_id: user_id,grantor_id: patient_id)
    if @requested_patients.blank?
      @documents_not_requested = @document.where('user_id = (?)', patient_id)
    else
      @documents_not_requested = @document.where('user_id = (?) AND id NOT IN (?)', user_id, @requested_patients.pluck(:document_id))
    end
    return @requested_patients, @documents_not_requested

  end

end
