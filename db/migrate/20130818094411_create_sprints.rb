class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :title
      t.integer :initiator_id
      t.text :description
      t.integer :project_id
      t.boolean :active

      t.timestamps
    end
  end
end
