class SprintsController <BaseController
	def index
		@sprints = current_user.sprints
		good_response @sprints
	end

	def show
		good_response @sprint
	end
	
	def edit
	end
	
	def destroy

	end
	
	def new
	end

	def create
		@sprint = Sprint.new(sprint_params.merge(:project_id => params[:project_id]))
		if @sprint.save
			good_response @sprint
		else
			bad_response "Something error" , @sprint.errors			
		end
	end

	private
	def define_sprint
		@sprint = Sprint.find(params[:id])
	end
	def sprint_params
		params.require(:sprint).permit(:start_at, :end_at, :description, :title, :initiator_id, :project_id, :active)
	end
end