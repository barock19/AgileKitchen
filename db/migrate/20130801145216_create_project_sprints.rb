class CreateProjectSprints < ActiveRecord::Migration
  def change
    create_table :project_sprints do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :complete, :default => false
      t.integer :project_id

      t.timestamps
    end
  end
end
