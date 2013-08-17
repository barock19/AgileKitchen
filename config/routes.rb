AgileKitchen::Application.routes.draw do
	# All parts READY!!
	member_action 		= [:show, :edit, :destroy]
	collection_action = [:create, :index, :new]
	concern(:story_recipeable){member{put :move}}
	concern(:storizeable){resources(:story_recipes, :only => collection_action)}
	concern :projectable do
		resources :sprints, :story_tags , :only => collection_action
		resources :project_members, :path => 'members', :only => collection_action
		resources :stories, :concerns => :storizeable,  :only => collection_action
	end

	# LIGHT GREEN!! All tunnels opened (route started here)
	devise_for :users
	# -------------------------------------------
	# start keep it sync
	# A
	scope :api do
		resources :projects , :concerns => :projectable
		resources :users
		resources :sprints, :story_tags , :project_members
		resources :stories, :concerns => :storizeable
		resources :story_recipes , :concerns => :story_recipeable
	end
	# -------------------><----------------------
	# B
	resources :projects, :concerns => :projectable
	resources :users
	resources :sprints, :story_tags , :stories, :project_members
	resources :stories, :concerns => :storizeable
	resources :story_recipes, :concerns => :story_recipeable

	# end keep it sync
	# -------------------------------------------

	# HIGHWAY
	root :to => "base#dashboard"
	# LIGHT RED!! All tunnels closed (route stoped here)
end