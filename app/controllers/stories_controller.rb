class StoriesController <BaseController
	before_filter :define_stories, :only => [:index]
	before_filter :define_story, :only => [:show, :edit, :update, :destroy]
	def show
		good_response @story
	end
	
	def edit
	end
	
	def destroy
	end
	
	def new
	end

	def create
		@story = Story.new(story_params.merge(:project_id => params[:project_id]))
		if @story.save
			good_response @story
		else
			bad_response "some error occuring", @story.errors
		end
	end

	def index
		good_response @stories
	end

	private
	def define_stories
		@stories = Story.where("initiator_id = :u_id or actor_id = :u_id", u_id: current_user.id).try{|r| 
			!params[:project_id].blank? ? r.where(:project_id => params[:project_id]) : r
		}
	end
	def define_story
		@story = Story.find(params[:id])
	end
	def story_params
		params.require(:story).permit(:short_desc, :long_desc, :actor_id, :velocity, :project_id)
	end

end