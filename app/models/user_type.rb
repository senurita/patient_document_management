class UserType < ApplicationRecord
  has_many :users, dependent: :destroy
end
