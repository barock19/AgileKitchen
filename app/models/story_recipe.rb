class StoryRecipe < ActiveRecord::Base
	FLOWS = %{cooking cooked tasting tasted}
  belongs_to :initiator, :class_name => 'User', :foreign_key => 'initiator_id'
  belongs_to :actor, :class_name => 'User', :foreign_key => 'actor_id'
  belongs_to :story
  validates :description, :initiator_id, :story_id , :presence => true
end
