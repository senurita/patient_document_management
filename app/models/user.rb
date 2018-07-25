class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
         
  has_many :documents, dependent: :destroy
  belongs_to :user_type, :foreign_key => 'user_type_id'

  has_many :requested_request_accesses, :class_name => 'RequestAccess', :foreign_key => 'requestor_id', dependent: :destroy
  has_many :granted_request_accesses, :class_name => 'RequestAccess', :foreign_key => 'grantor_id', dependent: :destroy


  def self.users_listing(user_id,user_type_id)
    return unless user_id.present? && user_type_id.present?
    if user_type_id == USER_MAPPING[1][:id] || user_type_id == USER_MAPPING[3][:id]
      @patients = User.where('user_type_id = (?)',USER_MAPPING[2][:id])
    elsif user_type_id == USER_MAPPING[2][:id]
      @requestors = RequestAccess.where(grantor_id: user_id, :status => RECORD_ACCESS_STATUS[0])
    end
    return @requestors, @patients
  end

  def self.create_access_request(user_id, patient_id, document_id)
    return unless user_id.present? && patient_id.present? && document_id.present?
    patient = User.where(:id => patient_id) 
    document = patient.first.documents.where(:id => document_id) if patient.present? 
    RequestAccess.create(requestor_id: user_id, grantor_id: patient_id, document_id: document_id) if document.present?
    return
  end

  def self.approve_access_request(user_id, requestor_id, document_id)
    return unless user_id.present? && requestor_id.present? && document_id.present?  
    request_access = RequestAccess.where(grantor_id: user_id, requestor_id: requestor_id, document_id: document_id).first
    request_access.status = RECORD_ACCESS_STATUS[1] if request_access.present?
    request_access.save! if request_access.present?
    return
  end

  def self.deny_access_request(user_id, requestor_id, document_id)
    return unless user_id.present? && requestor_id.present? && document_id.present?
    request_access = RequestAccess.where(grantor_id: user_id, requestor_id: requestor_id, document_id: document_id).first
    request_access.status = RECORD_ACCESS_STATUS[2] if request_access.present?
    request_access.save! if request_access.present?
    return
  end
end
