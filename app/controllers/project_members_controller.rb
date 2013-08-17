class ProjectMembersController < BaseController
	before_filter :define_project_members, :only => [:index]
	def index
		good_response @project_members.as_json(:include => {:member => {:only => [:id, :email, :full_name, :user_name], :methods => [:gravatar_url]}}, :only => [:role_id, :id])
	end

	def create
	end

	def edit
	end

	def show
	end

	def create
	end

	def update
	end
	private
	def define_project_members
		@project_members = ProjectMember.where(:project_id => params[:project_id])
	end
end