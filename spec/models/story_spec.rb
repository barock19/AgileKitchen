require 'spec_helper'

describe Story do
	let(:user){
		u = User.create(:email => "me@mail.com", :full_name => "My Full Name", :password => "alzid4ever")
		u.confirmed_at = Time.now ;u.save
		u
	}
	let(:project) do
		@project = Project.create(:name => "AgileProject", :initiator_id => user.id)
	end
	context "when create" do
		subject{Story.new(:initiator_id => user.id, :short_desc => "test", :long_desc => "teeeesst", :project_id => project.id)}
		context "ivalid setup" do
			before(:each){subject.save}
			it "must be invalid" do
				subject.valid?.should be_false
			end
			it_behaves_like "miss_attrs_new_record", [:velocity]
		end
		context "valid setup" do
			before(:each) do
				subject.velocity = 8
				subject.save
			end
			it "must be valid" do
				subject.valid?.should be_true
			end			
		end
	end
end