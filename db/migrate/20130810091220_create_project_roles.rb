class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.integer :project_id
      t.string :name
      t.text :regulation
      t.boolean :custom
      t.timestamps
    end
  end
end
