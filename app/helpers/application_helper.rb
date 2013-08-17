module ApplicationHelper
	def self.included base
		base.extend(ClassMethods)
	end
	module ClassMethods
		def member_actions
			[:show, :edit, :update, :destroy]
		end
		def collection_actions
			[:index]
		end
	end
end
