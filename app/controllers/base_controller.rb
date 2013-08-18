class BaseController <ApplicationController
	include BaseHelper
	include OrganizationsHelper
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, :if => :json_request?	
	before_filter :authenticate_user!
	def dashboard
		# render :text => "Dashboard"
	end

	rescue_from ActionController::UnknownFormat do |ex|
		bad_response ex.message 
	end
	rescue_from ActiveRecord::RecordNotFound do |ex|
		bad_response ex.message, {}, 404
	end
	rescue_from CanCan::AccessDenied do |ex|
		bad_response ex.message, {}, 401
 	end
end