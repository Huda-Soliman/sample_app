module ApplicationHelper

	#Return a title
	@base_title = "ROR tutorial |"
	def title 
		base_title = "ROR Tutorial"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	def logo
		 image_tag("/images/logo.png", :alt => "Sample app", :class => "round")
	end
end
