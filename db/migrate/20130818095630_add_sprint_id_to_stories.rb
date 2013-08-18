class AddSprintIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :sprint_id, :integer
    add_column :stories, :priority, :integer
  end
end
