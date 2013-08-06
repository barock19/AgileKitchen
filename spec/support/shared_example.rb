shared_examples "invalid_new_record" do |error_attributes|
	context "when these ( #{error_attributes.map{|s|s.to_s.gsub(/\_id/, '')}.join(',')} ) attributes not defined" do
		it "must be invalid" do
			subject.valid?.should be_false
		end
		it "message must be contains about these ( #{error_attributes.map{|s|s.to_s.gsub(/\_id/, '')}.join(',')} ) attributes" do
			subject.valid?
			subject.errors.to_a.join(",").should match(/#{error_attributes.map{|s|s.to_s.gsub(/\_id/, "")}.join("|")}/i)
		end
	end	
end
