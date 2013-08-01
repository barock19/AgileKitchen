class StoryTag < ActiveRecord::Base
  has_and_belongs_to_many :stories
end
