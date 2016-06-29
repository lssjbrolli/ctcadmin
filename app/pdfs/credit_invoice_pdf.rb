class CreditInvoicePdf < Prawn::Document

  def initialize(ci, view)
    super(page_size: 'A4')

    @ci = ci
    @view = view

    bounding_box([0, cursor], width: 540, height: 770) do
      transparent(1) { stroke_bounds }
      table1
      table2
      table3
      table4
      bounding_box([0, 115], width: 540, height: 150) do
        table5
        table6
      end
    end
  end

  def table1
    row1_1 = [{content: "Furnizor: #{SiteConfig['comapany.name']}", colspan: 2}, '', {content: 'FACTURA', colspan: 2}]
    row1_2 = [{content: "Nr.ord.Reg.Com/an: #{SiteConfig['company.registration']} ", colspan: 2}, '', {content: "Seria NT ACT Nr. #{'%07d' % @ci.number}", colspan: 2}]
    row1_3 = [{content: "C.U.I. #{SiteConfig['company.vat']}", colspan: 2}, '', {content: "Din data de #{@ci.date}", colspan: 2}]
    row1_4 = [{content: "Adresa: #{SiteConfig['company.address']}", colspan: 2, rowspan: 2}, {content: '', rowspan: 2}, {content: "Cumparator: #{@ci.client.name}", colspan: 2, rowspan: 2}]
    row1_5 = []
    row1_6 = [{content: "Cont Lei: #{SiteConfig['company.acc_ron']}", colspan: 2}, '', {content: "Nr ord Reg.Com/an: #{@ci.client.registration}", colspan: 2}]
    row1_7 = [{content: "Cont Euro: #{SiteConfig['company.acc_eur']}", colspan: 2}, '', {content: "C.U.I. #{@ci.client.vat}", colspan: 2}]
    row1_8 = [{content: "Banca: #{SiteConfig['company.bank']}", colspan: 2}, '', {content: "Adresa: #{@ci.client.address}", rowspan: 2, colspan: 2}]
    row1_9 = [{content: "Capital social: #{SiteConfig['company.capital']}", colspan: 2}, '']
    row1_10 = [{content: "Tel: #{SiteConfig['company.phone']}", colspan: 2}, '', {content: "Banca: #{@ci.client.bank}", colspan: 2}]
    row1_11 = [{content: "Cota TVA: #{@ci.tax_rate}", colspan: 2}, '', {content: "Cont: #{@ci.client.acc_ron}", colspan: 2}]

    table = make_table [
                           row1_1,
                           row1_2,
                           row1_3,
                           row1_4,
                           row1_5,
                           row1_6,
                           row1_7,
                           row1_8,
                           row1_9,
                           row1_10,
                           row1_11
                       ], width: 540, column_widths: [120, 120, 90, 100, 110], cell_style: {borders: [:top, :left, :bottom, :right], border_width: 0, size: 12, padding: 1, padding_left: 5, font: 'Times-Roman', character_spacing: 1}

    table.cells[0, 3].style(align: :center, size: 12, font_style: :bold)
    table.cells[1, 3].style(align: :center, size: 12, font_style: :bold)
    table.cells[2, 3].style(align: :center)
    table.cells[0, 0].style(size: 12, font_style: :bold)
    table.cells[3, 3].style(size: 12, font_style: :bold)


    table.before_rendering_page do |page|
      page.row(0).border_top_width = 1
      page.row(-1).border_bottom_width = 1
      page.column(0).border_left_width = 1
      page.column(-1).border_right_width = 1
    end

    table.draw
  end

  def table2
    table = make_table [
                           ['Denumire servicii sau produs', 'Cant', 'Pret unitar', 'Valoare', 'Valoare TVA']
                       ], width: 540, cell_style: {borders: [:top, :left, :right, :bottom], size: 12, padding: 5, font: 'Times-Roman', character_spacing: 1, align: :center}, column_widths: [190, 50, 100, 100, 100]

    table.draw
  end

  def table3
    table = make_table [
                           [{content: 'Transport conform contract:', colspan: 5}]
                       ], width: 540, cell_style: {borders: [:top, :left, :right], border_width: 1, size: 12, font: 'Times-Roman', character_spacing: 1}

    table.draw
  end

  def table4
    table line_items, width: 540, column_widths: [190, 50, 100, 100, 100], cell_style: {borders: [:top, :left, :bottom, :right], border_width: 0, size: 12, font: 'Times-Roman', character_spacing: 1} do
      columns(2..4).align = :right
      columns(1).align = :center
    end
  end

  def table5
    table = make_table [
                           [{content: "Intocmit de: #{@ci.created_by.first_name} #{@ci.created_by.last_name}, CNP: #{@ci.created_by.cnp} ", colspan: 3}, "Total Net: #{sel_currency(@ci.currency, @ci.net_value)}", "Total Tva: #{sel_currency(@ci.currency, @ci.tax_value)}"]
                       ], width: 540, cell_style: {size: 12, font: 'Times-Roman', character_spacing: 1}, column_widths: [100, 100, 65, 140, 135]
    table.draw
  end

  def table6
    table = make_table [
                           [{content: 'Semnatura si stampila furnizorului', rowspan: 6}, {content: 'Date privind expeditia', colspan: 4}],
                           [{content: "Nume delegat: #{@ci.delegat}", colspan: 4}],
                           [{content: "Act identitate: #{@ci.ci}", colspan: 4}],
                           [{content: "Eliberat de: #{@ci.eliberat}", colspan: 4}],
                           [{content: "Mijloc de transport: #{@ci.transport}", colspan: 2}, {content: 'Semnatura de primire', rowspan: 2}, {content: "Total factura: #{sel_currency(@ci.currency, @ci.total_value)}", rowspan: 2}],
                           [{content: 'Semnatura', colspan: 2}]
                       ], width: 540, column_widths: [80], cell_style: {size: 12, padding: 1, padding_left: 5, font: 'Times-Roman', character_spacing: 1}

    table.draw
  end

  def line_items
    @ci.credit_notes.map do |item|
      ["nr: #{item.number}", '1', sel_currency(@ci.currency, item.value), sel_currency(@ci.currency, item.value), sel_taxrate(@ci.currency, @ci.tax_rate, item.value)]
    end
  end

  def sel_currency(cur, value)
    if cur == 'RON'
      @view.number_to_currency(value, locale: :ro)
    else
      @view.number_to_currency(value)
    end
  end

  def sel_taxrate(cur, tax, value)
    unless tax == 'taxare inversa'
      tax_f = tax.split('%')[0].to_f/100
      sel_currency(cur, value * tax_f)
    end
  end
end
