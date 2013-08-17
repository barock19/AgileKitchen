class StoryRecipesController <BaseController
	before_filter :define_story_recipes, :only => [:index]
	before_filter :define_story_recipe, :only => member_actions
	def show
		good_response @story_recipe
	end
	
	def edit
	end
	
	def destroy
	end
	
	def new
	end

	def create
		@story_recipe = StoryRecipe.new(story_recipe_params.merge(:story_id => params[:story_id]))
		if @story_recipe.save
			good_response @story_recipe
		else
			bad_response "some error occuring", @story_recipe.errors
		end		
	end

	def index
		good_response @stories
	end

	private
	def define_story_recipes
		@stories = StoryRecipe.where("story_recipes.initiator_id = :u_id or story_recipes.actor_id = :u_id", u_id: current_user.id).try{|r| 
			!params[:story_id].blank? ? r.where(:story_id => params[:story_id]) : r
		}.try{|r|
			!params[:project_id].blank? ? r.joins(:story).where(:stories => {:project_id => params[:project_id]}) : r
		}
	end

	def define_story_recipe
		@story_recipe = StoryRecipe.find(params[:id])
	end

	def story_recipe_params
		params.require(:story_recipe).permit(:description, :state)
	end
end