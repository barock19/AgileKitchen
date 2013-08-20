require 'spec_helper'

describe Sprint do
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
	before(:each){
		5.times do
			Story.create(:initiator_id => user.id, :short_desc => "test", :long_desc => "teeeesst", :project_id => project.id, :velocity => 8)
		end
	}
	context "when created" do
		context "when there isn't active sprint in project targeted" do
			before(:each) do
				@sprint = Sprint.new(:start_at => Time.now+4.days , :end_at => Time.now+2.week, :project_id => project.id)
			end
			it "must be valid" do
				@sprint.valid?.should be_true
			end
			it "must have 24 velocity total" do
				@sprint.save
				@sprint.total_velocity.should eq(24)
			end
		end
		context "when there ia active sprint in project targeted" do
			before(:each) do
				Sprint.create(:start_at => Time.now+4.days , :end_at => Time.now+2.week, :project_id => project.id)
				@sprint = Sprint.new(:start_at => Time.now+4.days , :end_at => Time.now+2.week, :project_id => project.id)
			end
			it "must be invalid" do
				@sprint.valid?.should be_false
			end
		end
	end

end