module ApplicationHelper

	#Return a title
	def title 
		base_title = "ROR Tutorial"
		if @title.nil?
			base_title
		else
			"#{base_tile} | #{@title}"
		end
	end
	def logo
		 image_tag("/images/logo.png", :alt => "Sample app", :class => "round")
	end
end
