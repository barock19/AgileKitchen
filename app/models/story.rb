class Story < ActiveRecord::Base
	belongs_to :project
  belongs_to :initiator, :class_name => 'User'
  belongs_to :actor, :class_name => 'User'
end
