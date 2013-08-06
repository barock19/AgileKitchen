class Organization < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :initiator, :class_name => "User"
  has_many :projects
end
