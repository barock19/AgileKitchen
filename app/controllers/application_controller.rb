class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  around_filter :_send_role_to_ar
  def root_page
  	render :text => "root_page"
  end
  private 
  def json_request?
  	!request.content_mime_type.nil?
  end
	def _send_role_to_ar
    accessor = current_user
    kelasess = [ActiveRecord::Base, ActiveRecord::Base.class]

    kelasess.each do |kelas|
      kelas.send(:define_method, "current_user", proc {accessor})
    end
    yield
    kelasess.each do |kelas|
      kelas.send :remove_method, "current_user"
    end
  end  
end
