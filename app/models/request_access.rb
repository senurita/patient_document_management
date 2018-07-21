class RequestAccess < ApplicationRecord
	belongs_to :requestor, class_name: 'User', :foreign_key => 'requestor_id'
    belongs_to :grantor, class_name: 'User', :foreign_key => 'grantor_id'

    validates :status, :inclusion => { :in => %w(pending approved denied) }
    validates_uniqueness_of :requestor_id, scope: :grantor_id
end
