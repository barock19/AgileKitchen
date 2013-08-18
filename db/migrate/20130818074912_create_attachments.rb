class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :image_url
      t.references :resourceable, :polymorphic => true

      t.timestamps
    end
  end
end
