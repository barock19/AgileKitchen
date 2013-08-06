class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :organization
  belongs_to :initiator, :class_name => "User"
  validates :initiator_id, presence: true
  validates_associated :initiator
end
