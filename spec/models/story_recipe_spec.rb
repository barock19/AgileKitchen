require 'spec_helper'

describe StoryRecipe do
	let(:user){
		u = User.create email: "me@mail.com", 
										full_name: "My Full Name", 
										password: "alzid4ever"
		u.confirmed_at = Time.now ;u.save
		u
	}
	let(:project){
		Project.create(:name => "AgileProject", :initiator_id => user.id)
	}
	let(:story){
		Story.create(:initiator_id => user.id, :short_desc => "test", :long_desc => "teeeesst", :project_id => project.id, :velocity => 8)
	}
	context "when create" do
		subject{@recipe = StoryRecipe.new(:description => "test", :initiator_id => user.id)}
		context "when without story" do
			it_behaves_like "miss_attrs_new_record", [:story_id]
		end
		context "when with story" do
			before(:each){subject.story_id = story.id}
			it "must be valid" do
				subject.valid?.should be_true
			end
		end
	end
end