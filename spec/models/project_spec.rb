require 'spec_helper'

describe Project do
	context "when create new Project" do
		subject{Project.new}
		it_behaves_like "invalid_new_record", [:initiator_id]
	end
end