class ImageToPdf < Prawn::Document
	def initialize(file)
		super()
		@file = file

		container
	end

	def add_image(file)
		image "#{file}", :width => 610, :height => 790
	end

	def container
		bounding_box([-35, 755], :width => 610, :height => 790) do
			@file.each do |f|
				add_image(f)
				transparent(0.5) { stroke_bounds }
			end
		end
	end

end