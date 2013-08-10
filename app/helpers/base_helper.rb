module BaseHelper
	def bad_response message, data = {}, code = 400 
		respond_to do |wants|
			wants.json { render :json => {:message => message , :data => data}, :status => code  }
			wants.html { render :status => code, :text => message}
		end
	end
	
	def good_response data, code = 200, message = ""
		respond_to do |wants|
			wants.json { render :json =>  data.to_json , code: code , message: message}
			wants.xml  { render :xml  =>  data.to_xml , code: code , message: message}
		end
	end
  def block_off?(block)
		@_block_off = [] if @_block_off.nil?
		@_block_off.include?(block)
	end
	def block_off(block)
		@_block_off = [] if @_block_off.nil?
		block = [block] if block.class == Symbol
		@_block_off = @_block_off + block
	end
	def block_off=(block)
		@_block_off = [] if @_block_off.nil?
		block = [block] if block.class == Symbol
		@_block_off = block
	end

	def block_reserved?(block)
		(content_for?(block) and !block_off?(block))
	end
	def page_title
		unless @overide_page_title
			"AgileKitchen | #{@page_title.nil? ? params[:controller].titleize.gsub(/\//, " ") : @page_title}"
		else
			@overide_page_title
		end
	end
	def body_idif
		"#{params[:controller].gsub(/\//, "-")}__#{params[:action]}"
	end
end
