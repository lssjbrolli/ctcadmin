class TripPdf < Prawn::Document
  def initialize(report, view)
    super(page_size: 'A4')

    # Register Roboto Slab font
    self.font_families.update(
      'RobotoSlab' => {
        normal: Rails.root.join("vendor/assets/fonts/Roboto_Slab/static/RobotoSlab-Regular.ttf"),
        italic: Rails.root.join("vendor/assets/fonts/Roboto_Slab/static/RobotoSlab-Italic.ttf"),
        bold: Rails.root.join("vendor/assets/fonts/Roboto_Slab/static/RobotoSlab-Bold.ttf"),
        bold_italic: Rails.root.join("vendor/assets/fonts/Roboto_Slab/static/RobotoSlab-BoldItalic.ttf")
      }
    )
    font 'RobotoSlab'

    @report = report
    @view = view
    @trip_expenses = []
    @report.each { |x| @trip_expenses << TripExpense.find_by_intnr(x) }
    @trip_expenses.sort_by! { |x| x.intnr[/\d+/].to_i }

    @dates = []
    @trip_expenses.each { |x| @dates << x.date }
    @dates.sort!

    head
    header
    content
    total
  end

  def head
    table = make_table([[title]], width: 540, column_widths: [540])
    table.cells.style(size: 14, font_style: :bold, align: :center)

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 2
      page.row(-1).border_bottom_width = 0
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end
    table.draw
  end

  def header
    data = ['Nr. crt.', 'Nr. actului', 'Data', 'Descrierea', 'Card', 'Suma originala', 'Suma in EUR']
    table = make_table([data], width: 540, column_widths: [45, 95, 60, 110, 40, 100, 90])

    table.cells.style(size: 12, font_style: :bold)
    table.cells[0, 1].style(align: :center)
    table.cells[0, 2].style(align: :center)
    table.cells[0, 3].style(align: :center)
    table.cells[0, 4].style(align: :center)
    table.cells[0, 5].style(align: :right)
    table.cells[0, 6].style(align: :right)

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 2
      page.row(-1).border_bottom_width = 2
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end
    table.draw
  end

  def line_items
    @trip_expenses.map do |item|
      ["#{item.intnr}", "#{item.number}", item.date.strftime('%d.%m.%y'), "#{item.description}", card(item), @view.number_to_currency(item.value, :unit => item.currency), @view.number_to_currency(item.value_eur, unit: 'EUR')]
    end
  end

  def content
    table = make_table line_items, width: 540, column_widths: [45, 95, 60, 110, 40, 100, 90]

    table.cells.style(size: 10)
    table.columns(0..4).style(align: :center)
    table.columns(5..6).style(align: :right)

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 2
      page.row(-1).border_bottom_width = 2
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end

    table.draw
  end

  def total
    value_a = []
    @trip_expenses.each { |x| value_a << x.value_eur }
    total = value_a.inject(0) { |r, e| r + e }

    table = make_table [['', 'Total:', @view.number_to_currency(total, unit: 'EUR')]], width: 540, column_widths: [350, 100, 90]

    table.cells.style(size: 12, font_style: :bold)
    table.cells[0, 1].style(align: :center)
    table.cells[0, 2].style(align: :right)

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 2
      page.row(-1).border_bottom_width = 2
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end

    table.draw
  end

  private

  def title
    if @dates[0].month == @dates[-1].month
      "Decont plati deplasare #{@dates[0].strftime('%B %Y')}"
    else
      "Decont plati deplasare #{@dates[0].strftime('%B %Y')} - #{@dates[-1].strftime('%B %Y')}"
    end
  end

  def card(item)
    if item.card
      'Da'
    else
      'Nu'
    end
  end
end
