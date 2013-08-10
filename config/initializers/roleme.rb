module RoleMe
	def self.included(base)
		base.extend(ClassMethods)
		base.init_roleme
	end
	def _init_initiator
		self.initiator_id = current_user.id
	end
	module ClassMethods
		def init_roleme
			after_initialize :_init_initiator, :if => "respond_to?(:initiator_id=) and respond_to?(:current_user) and !current_user.blank? and new_record?"
		end
	end
end
ActiveRecord::Base.send(:include, RoleMe)
