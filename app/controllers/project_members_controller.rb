class ProjectMembersController < BaseController
	before_filter :define_project_members, :only => [:index]
	def index
		good_response @project_members.as_json(:include => {:member => {:only => [:id, :email, :full_name, :user_name], :methods => [:gravatar_url]}}, :only => [:role_id, :id])
	end

	def create
		@project_member = ProjectMember.new(project_member_params.merge(:project_id => params[:project_id]))
		if @project_member.save
			good_response @project_member
		else
			bad_response @project_member.errors
		end
	end

	def edit
	end

	def show
	end

	def update
	end
	private
	def define_project_members
		@project_members = ProjectMember.where(:project_id => params[:project_id])
	end

	def project_member_params
		params.require(:project_member).permit(:user_id)
	end
end