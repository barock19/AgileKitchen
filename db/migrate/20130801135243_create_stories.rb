class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :project_id
      t.string :short_desc
      t.text :long_desc
      t.integer :initiator_id
      t.integer :actor_id
      t.integer :velocity

      t.timestamps
    end
  end
end
