class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
         
  has_many :documents, dependent: :destroy
  has_many :owned_surveys, :class_name => 'Survey', :foreign_key => 'owner_id'
  has_many :admin_surveys, :class_name => 'Survey', :foreign_key => 'admin_id'  
end
