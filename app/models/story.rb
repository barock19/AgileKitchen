class Story < ActiveRecord::Base
  has_and_belongs_to_many :story_tags
	belongs_to :project
  belongs_to :initiator, :class_name => 'User'
  belongs_to :actor, :class_name => 'User'
end
