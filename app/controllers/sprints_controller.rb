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
	end

	private
	def define_sprint
		@sprint = Sprint.find(params[:id])
	end
	def sprint_params
		params.require(:sprint).permit(:start_at, :end_at)
	end
end