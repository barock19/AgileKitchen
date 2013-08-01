class StoryRecipe < ActiveRecord::Base
  belongs_to :initiator, :class_name => 'User'
  belongs_to :actor, :class_name => 'User'
  belongs_to :story
end
