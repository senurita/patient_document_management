class Document < ApplicationRecord
	belongs_to :user, :foreign_key => 'user_id'
	has_many :request_accesses, dependent: :destroy

end
