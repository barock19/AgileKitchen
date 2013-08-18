class Sprint < ActiveRecord::Base

	belongs_to :project
	belongs_to :initiator , :class_name => "User", :foreign_key => "initiator_id"
	has_many :stories
	validate :check_current_active_project_sprint
	after_create :add_id_sprint_to_story

	after_initialize :define_default_active , :if => "new_record?"

	def define_default_active
		self.active = true
	end

	def check_current_active_project_sprint
		errors.add :project_id, "There is a current active sprint" if Sprint.where(:project_id => project_id, :active => true).count > 0
	end

	def add_id_sprint_to_story
		stories = Story.where(:project_id => project_id).order("priority ASC")
		velo_counter = 0
		stories.each do |story|
			if velo_counter < 30 and (velo_counter + story.velocity) <= 30
				velo_counter += story.velocity
				story.sprint_id = self.id
				story.save
			else 
				break
			end
		end

	end
end
