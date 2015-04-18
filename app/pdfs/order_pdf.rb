class OrderPdf < Prawn::Document
	def initialize(file)
		super()
		@file = file

		container
	end

end