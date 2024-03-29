# frozen_string_literal: true

class PaymentReportPdf < Prawn::Document
  def initialize(month)
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

    @month = Date.parse(month.to_s)
    
    @payments_ids = []
    Payment.where('DATE(month) = ?', @month).where(diurna: true).each { |x| @payments_ids << x.id }

    if @payments_ids.empty?
      text "#{@month.strftime('%B %Y')} doesn't have any payments."
    else
      @payments = []
      @payments_ids.each { |x| @payments << Payment.find(x) }

      head
      header
      content
    end
  end

  def head
    table = make_table([["Indemnizatii detasare transnationala #{@month.strftime('%B %Y')}"]], width: 540, column_widths: [540])
    table.cells.style(size: 12, font_style: :bold, align: :center)

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 2
      page.row(-1).border_bottom_width = 0
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end
    table.draw
  end

  def header
    data = ['Nume angajat', 'Avans', 'Rest', 'Total', 'Zile', 'Indemnizatie per zi']
    table = make_table([data], header: true, width: 540, column_widths: [150, 80, 80, 80, 60, 90])

    table.cells.style(size: 12, font_style: :bold)
    for i in 0..5 do
      table.cells[0, i].style(align: :center)
    end

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 2
      page.row(-1).border_bottom_width = 2
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end
    table.draw
  end

  def content
    table = make_table line_items, width: 540, column_widths: [150, 80, 80, 80, 60, 90]

    table.cells.style(size: 10)
    table.columns(0..5).style(align: :center)

    table.before_rendering_page do |page|
      page.row(0).border_top_width = 0
      page.row(-1).border_bottom_width = 2
      page.column(0).border_left_width = 2
      page.column(-1).border_right_width = 2
    end

    table.draw
  end

  private

  def line_items
    @payments.map do |item|
        [
          "#{item.employee.name}", "#{item.avans_diurna&.format}",
          "#{item.rest_diurna&.format}", "#{item.total_diurna.format}",
          "#{item.days}", "#{item.per_day} EUR"
        ]
    end
  end
end
