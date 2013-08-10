class StoryTagsController <BaseController
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
	def story_tag_params
		params.require(:story_tag).permit(:name, :color)
	end
end