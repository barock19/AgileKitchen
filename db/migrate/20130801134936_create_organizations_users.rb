class CreateOrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :organizations_users, :id => false do |t|
      t.references :organization, :user
    end

    add_index :organizations_users, [:organization_id, :user_id],
      name: "organizations_users_index",
      unique: true
  end
end
