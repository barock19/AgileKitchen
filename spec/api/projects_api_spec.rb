require 'spec_helper'

describe "Project API" do
	context "create project" do
		before(:each) do
			puts User.count
			@user = User.create\
				full_name: 	"Zidni Mubarock",
				email: 			"zidubarock@example.com",
				password: 	"1234rewQ"
			@user.confirmed_at= Time.now
			@user.save
		end
		it "should be true" do
			puts headers
			true.should be_true
		end
		it "should be true2" do
			puts headers
			true.should be_true
		end

	end
end