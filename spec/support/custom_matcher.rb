RSpec::Matchers.define :be_a_bolean do 
  match do |actual|
    [TrueClass, FalseClass].include?(actual.class)
  end
end
RSpec::Matchers.define :raise_any_error do
  $err = nil
  match do |block|
  	error_raised(&block)
  end

  def error_raised
  	error = false
   	begin
   		yield
   	rescue Exception => e
   		$err =  e
   		error = true
   	end
   	error
  end
 
  failure_message_for_should do
    "expected to should raise any error but got no error"
  end

  failure_message_for_should_not do
    "expected to not should raise error but got \"#{$err.class}\" with message \"#{$err.message}\""
  end
end