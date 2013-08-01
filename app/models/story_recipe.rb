class StoryRecipe < ActiveRecord::Base
	FLOWS = %{cooking cooked tasting tasted}
  belongs_to :initiator, :class_name => 'User'
  belongs_to :actor, :class_name => 'User'
  belongs_to :story
end
