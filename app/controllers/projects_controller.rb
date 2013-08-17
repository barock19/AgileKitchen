class ProjectsController <BaseController
	before_action :define_project, :only => [:show, :edit, :destroy] 
	def index
		@projects = current_user.projects
		good_response @projects
	end

	def show
		good_response @project
	end

	def edit
	end
	
	def destroy
	end
	
	def new
	end

	def create
		@project = Project.new(project_params.merge(organization_id))
		if @project.save
			good_response @project
		else
			bad_response "some error occuring", @project.errors
		end
	end

	private
	def define_project
		@project = Project.find params[:id]
	end
	def project_params
		params.require(:project).permit(:description, :name)
	end

end