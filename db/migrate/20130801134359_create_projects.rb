class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :organization_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
