class TripPdf < Prawn::Document

	def initialize(report, view)
		super(page_size: 'A4')

		@report        = report
		@view          = view
		@trip_expenses = []
		@report.each { |x| @trip_expenses << TripExpense.find_by_int_id(x) }

		@dates = []
		@trip_expenses.each { |x| @dates << x.date }
		@dates.sort!

		head
		header
		content
		total
	end

	def head
		table = make_table([["Decont plati deplasare #{@dates[0].month}.#{@dates[0].year} - #{@dates[-1].month}.#{@dates[-1].year}"]], width: 523)
		table.cells.style(size: 14, font_style: :bold, align: :center)

		table.before_rendering_page do |page|
			page.row(0).border_top_width       = 2
			page.row(-1).border_bottom_width   = 0
			page.column(0).border_left_width   = 2
			page.column(-1).border_right_width = 2
		end
		table.draw
	end


	def header
		data  = ['Nr. crt.', 'Nr. actului', 'Data', 'Descrierea', 'Suma originala', 'Suma in EUR']
		table = make_table([data], header: true, width: 523, column_widths: [48, 100, 75, 115, 100, 85])

		table.cells.style(size: 12, font_style: :bold)
		#table.cells[0,0].style(width: 65)
		table.cells[0, 1].style(align: :center)
		table.cells[0, 2].style(align: :center)
		table.cells[0, 3].style(align: :center)
		table.cells[0, 4].style(align: :right)
		table.cells[0, 5].style(align: :right)

		table.before_rendering_page do |page|
			page.row(0).border_top_width       = 2
			page.row(-1).border_bottom_width   = 2
			page.column(0).border_left_width   = 2
			page.column(-1).border_right_width = 2
		end
		table.draw
	end

	def line_items
		@trip_expenses.map do |item|
			["#{item.id}", "#{item.number}", "#{item.date}", "#{item.description}", @view.number_to_currency(item.value, :unit => item.currency), @view.number_to_currency(item.value_eur, unit: 'EUR')]
		end
	end

	def content
		table = make_table line_items, width: 523, column_widths: [48, 100, 75, 115, 100, 85]

		table.cells.style(size: 10)
		table.columns(0..3).style(align: :center)
		table.columns(4..5).style(align: :right)


		table.before_rendering_page do |page|
			page.row(0).border_top_width       = 0
			page.row(-1).border_bottom_width   = 0
			page.column(0).border_left_width   = 2
			page.column(-1).border_right_width = 2
		end

		table.draw
	end

	def total
		value_a = []
		@trip_expenses.each { |x| value_a << x.value_eur }
		total = value_a.inject(0) { |r, e| r + e }

		table = make_table [['', 'Total:', @view.number_to_currency(total, unit: 'EUR')]], width: 523, column_widths: [338, 100, 85]

		table.cells.style(size: 12, font_style: :bold)
		table.cells[0, 1].style(align: :center)
		table.cells[0, 2].style(align: :right)

		table.before_rendering_page do |page|
			page.row(0).border_top_width       = 2
			page.row(-1).border_bottom_width   = 2
			page.column(0).border_left_width   = 2
			page.column(-1).border_right_width = 2
		end

		table.draw
	end
end
