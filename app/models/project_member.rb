class ProjectMember < ActiveRecord::Base
	belongs_to :member, :class_name => 'User', :foreign_key => 'user_id'
	belongs_to :project
	validate :validate_user_and_project_existence
	validates :user_id, :uniqueness => {:scope => :project_id,
		:message => ->(error, attributes){
     "#{User.find(attributes[:value].to_i).email} already added to this project" 
     }}

     def validate_user_and_project_existence
     	errors.add :user_id, "Not Found" if User.where(:id => user_id).first.nil?
    	errors.add :project_id, "Not Found" if Project.where(:id => project_id).first.nil?
     end
end
