class StoriesController <BaseController
	before_action :define_stories, :only => [:index]
	before_action :define_story, :only => [:show, :edit, :update, :destroy]
	before_action :define_new_story, :only => [:create]

	load_and_authorize_resource :project
	load_and_authorize_resource :story , :through => :project

	def show
		good_response @story.as_json(:include => [:attachments, :project], :except => [:id], :methods => [:asuh])
	end
	
	def edit
	end
	
	def destroy
		if @story.destroy
			good_response :message => " story #{@story.id} successfully deleted"
		else
			bad_response @story.erros
		end
	end
	
	def new
	end

	def create

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
	def define_new_story
		@story = Story.new(story_params.merge(:project_id => params[:project_id]))
	end
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