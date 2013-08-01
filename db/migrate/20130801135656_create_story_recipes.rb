class CreateStoryRecipes < ActiveRecord::Migration
  def change
    create_table :story_recipes do |t|
      t.integer :story_id
      t.text :description
      t.integer :actor_id
      t.integer :initiator_id
      t.string :state

      t.timestamps
    end
  end
end
