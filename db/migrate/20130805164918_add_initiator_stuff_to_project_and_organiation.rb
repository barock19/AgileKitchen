class AddInitiatorStuffToProjectAndOrganiation < ActiveRecord::Migration
  def change
  	add_column :projects, :initiator_id, :integer 
  	add_column :organizations, :initiator_id, :integer   	
  end
end
