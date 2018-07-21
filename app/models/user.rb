class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
         
  has_many :documents, dependent: :destroy
  belongs_to :user_type, :foreign_key => 'user_type_id'

  has_many :requested_request_accesses, :class_name => 'RequestAccess', :foreign_key => 'requestor_id', dependent: :destroy
  has_many :granted_request_accesses, :class_name => 'RequestAccess', :foreign_key => 'grantor_id', dependent: :destroy

end
