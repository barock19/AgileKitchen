require 'spec_helper'

describe Project do
	context "create project" do
		let(:user){
			u = User.create(:email => "me@mail.com", :full_name => "My Full Name", :password => "alzid4ever")
			u.confirmed_at = Time.now ;u.save
			u
		}
		before(:each) do
			@project = Project.create(:name => "AgileProject", :initiator_id => user.id)
		end
		it "will add the initiator as project members" do
			@project.members.include?(user).should be_true
		end
		it "the project showed on initiator owned_projects" do
			user.owned_projects.include?(@project).should be_true
		end
		context "when add others members" do
			let(:project){@project}
			let(:user2){
				u = User.create(:email => "me2@mail.com", :full_name => "My Full Name", :password => "alzid4ever")
				u.confirmed_at = Time.now ; u.save
				u
			}
			before(:each) do
				project.members << user2
			end
			it "show 2 members" do
				project.members.count.should eq(2)
			end
			it "will add the new born" do
				project.members.include?(user2).should be_true
			end
		end
	end
end