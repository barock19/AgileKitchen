class Project < ActiveRecord::Base
	belongs_to :organization
	belongs_to :initiator, :class_name => "User"
	has_many :project_roles
	has_many :project_members
	has_many :members, :through => :project_members
	has_many :stories
	validates :initiator_id, presence: {:in => true, :message => "project must be belongs to %{attribute}"}
	validates_associated :project_members
	validates :name, :uniqueness => {:scope => :initiator_id,
	:message => ->(error, attributes){
	 "#{attributes[:value]} already taken" 
	 }}
	after_create :add_initiator_to_project_members
	def add_initiator_to_project_members
		members << initiator
	end
	def declare_project_role
		# scrum_master, #product_owner, #developer, #tester
	end
end
