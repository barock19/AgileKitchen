class CreateStoryTags < ActiveRecord::Migration
  def change
    create_table :story_tags do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
