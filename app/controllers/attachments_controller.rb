class AttachmentsController < BaseController
  	before_action :define_attachment, :only => [:show, :edit , :destroy]
 
	def create
		@attachment = Attachment.new(attachment_params)
		if @attachment.save
			good_response @attachment
		else
			bad_response "Something errors", @attachment.errors
		end
	end

	def edit
	end

	def method_name
		
	end

	private
	def define_attachment
		@attachment = Attachment.find params[:id]
	end

	def attachment_params
		params.require(:attachment).permit(:image_url, :resourceable_id, :resourceable_type)
	end
end