class RaportPdf < Prawn::Document

	def initialize(raport, view)
		super(page_size: "A4")

		@raport = raport
		@view = view

		table1
	end

	def table1
		
	end
end
