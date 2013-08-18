class Attachment < ActiveRecord::Base
belongs_to :resourceable, :polymorphic => true
end
