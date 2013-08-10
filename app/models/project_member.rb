class ProjectMember < ActiveRecord::Base
	belongs_to :member, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :project
	validates :user_id, :uniqueness => {:scope => :project_id,
		:message => ->(error, attributes){
     "#{User.find(attributes[:value].to_i).email} already added to this project" 
     }}
end
