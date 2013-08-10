class StoriesController <BaseController
	def show
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
	def story_params
		params.require(:sprint).permit(:short_desc, :long_desc, :actor_id, :velocity, :project_id)
	end

end