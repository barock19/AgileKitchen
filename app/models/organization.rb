class Organization < ActiveRecord::Base
  belongs_to :initiator, :class_name => "User"
  has_many :projects
end
