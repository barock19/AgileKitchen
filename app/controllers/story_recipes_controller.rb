class StoryRecipesController <BaseController
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
	def story_recipe_params
		params.require(:story_recipe).permit(:description, :state, :project_id, :story_id)
	end
end