class Ability
	include CanCan::Ability
	attr_reader :user, :request
	def initialize(user, request = false)
		@user = user
		@request = request
		all_you_can_do
		what_yours_is_yours
	end
	def all_you_can_do
		cannot :manage, :all
	end
	def what_yours_is_yours
		# read
		can :show, Project do |project|
			project.members.where(:id => [user.id]).count > 0			
		end
		can [:show], [Story, StoryRecipe]

		# update - destroy
		can [:update, :destroy], [Story, StoryRecipe], :actor_id => user.id
		can [:update, :destroy], [Story, StoryRecipe, Project], :initiator_id => user.id
		# create
		can [:create], [Project, Story, StoryRecipe]
		
	end
end
