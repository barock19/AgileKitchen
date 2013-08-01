class CreateStoriesStoryTags < ActiveRecord::Migration
  def change
    create_table :stories_story_tags, :id => false do |t|
      t.references :story, :story_tag
    end

    add_index :stories_story_tags, [:story_id, :story_tag_id],
      name: "stories_story_tags_index",
      unique: true
  end
end
