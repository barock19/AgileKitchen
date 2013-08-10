require 'spec_helper'

describe Project do
	context "when create new Project" do
		subject{Project.new}
		it_behaves_like "miss_attrs_new_record", [:initiator_id, :organization_id]
		context "when all req attributes defined" do
			before(:each) do
				@initiator = FactoryGirl.create(:user, :email => "zidmubarock@gmail.com", :password => "A1234rewq")
				@organization = FactoryGirl.create(:organization, :initiator_id => @initiator.id)
				@project = Project.new
				@project.initiator = @initiator
				@project.organization = @organization
			end
			subject{@project}
			it "must be valid" do
				subject.valid?.should be_true
			end
		end
	end

end