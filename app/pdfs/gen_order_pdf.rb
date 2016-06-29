#A4(landscape) pdf points dimensions = 595 × 842
class GenOrderPdf < Prawn::Document

  def initialize(params, order_id)

    super(page_size: 'A4', page_layout: :landscape)

    @payment = Payment.find(params[:payment])

    @order_id = order_id

    if params[:begin]
      @first_day = Date.parse(params[:begin])
    else
      @first_day = @payment.month.at_beginning_of_month
    end

    if @payment.days < @payment.month.at_end_of_month.day
      @last_day = @first_day.next_day(@payment.days - 1)
    else
      @last_day = @payment.month.at_end_of_month
    end

    strike_negative

    bounding_box([0, cursor], width: 367, height: 523) do
      table1
      table2
    end

    bounding_box([403, 523], width: 367, height: 523) do
      table3
      table5
      table6
      table7
    end

  end

  def table1

    data = [['Unitatea', {content: 'Depus decontul (numarul si data)', colspan: 2}],
            [{content: 'SC. Cozma Transport 2005 SRL', colspan: 2}, "#{'. '*5}#{generate_number} din #{@last_day.strftime('%d/%m/%Y')}#{'. '*5}"],
            [{content: 'Ordin de deplasare nr. ', colspan: 3}],
            [{content: "Domnul (a) #{'. '*3}#{@payment.employee.name}#{'. '*50}", colspan: 3}],
            [{content: "avand functia de #{'. '*5} conducator auto #{'. '*50}", colspan: 3}],
            [{content: "este delegat pentru #{'. '*5}transport marfa #{'. '*50}", colspan: 3}],
            [{content: "#{'. '*200}", colspan: 3}],
            [{content: "#{'. '*200}", colspan: 3}],
            [{content: " la #{'. '*5}NTG Nordic A/S #{'. '*100}", colspan: 3}],
            [{content: "#{'. '*5}Danemarca#{'. '*100}", colspan: 3}],
            [{content: "Durata deplasarii de la #{'. '*3}#{@first_day.strftime('%d/%m/%Y')}#{'. '*15}", colspan: 2}, "la #{'. '*3}#{@last_day.strftime('%d/%m/%Y')}#{'. '*15}"],
            [{content: "se legitimeaza cu #{'. '*50} ", colspan: 3}],
            [{content: 'Stampila unitatii si semnatura.', colspan: 3}],
            [{content: "Data #{'. '*5}#{@last_day.strftime('%d/%m/%Y')}#{'. '*5}", colspan: 3}]]

    table1 = make_table(data, width: 366) do |t|

      t.cells.border_width = 0
      t.cells.style(size: 10, height: 20)
      t.cells[0, 0].style(align: :center)
      t.cells[0, 1].style(align: :right)
      t.cells[1, 0].style(align: :left)
      t.cells[1, 1].style(align: :right)
      t.cells[2, 0].style(align: :center, size: 14, height: 32, font_style: :bold)
      t.cells[12, 0].style(align: :right, height: 40)

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end

    table1.draw
  end

  def table2

    data2 = [["Sosit #{'. '*100}"],
             ["Plecat #{'. '*100}"],
             ["Cu (fara) cazare #{'. '*100}"],
             ['Stampila unitati si semnatura'],
             ['']
    ]

    table2 = make_table(data2, width: 183.5) do |t|

      t.cells.border_width = 0
      t.cells.style(size: 10, height: 20)
      t.cells[3, 0].style(align: :center)
      t.cells[4, 0].style(height: 25)

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end


    table = make_table([[table2, table2],
                        [table2, table2]])
    table.draw

  end

  def table3

    data3 = [["Ziua si ora plecarii #{'. '*50}"],
             ["Ziua si ora sosirii #{'. '*50}"],
             ["Data depunerii #{'. '*50}"],
             ["Penalizari calculate #{'. '*50}"],
    ]

    data4 = [['Avans spre decontare'],
             ["Primit la plecare #{'. '*50}"],
             ["Primit in timpul deplasarii #{'. '*3}#{@payment.avans}#{'. '*30}"],
             ["TOTAL #{'. '*3}#{@payment.avans} EUR#{'. '*30}"]
    ]

    table3 = make_table(data3, width: 183.5) do |t|

      t.cells.border_width = 0
      t.cells.style(size: 10, height: 20)

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end

    table4 = make_table(data4, width: 183.5) do |t|

      t.cells.border_width = 0
      t.cells.style(size: 10, height: 20)
      t.cells[3, 0].style(font_style: :bold)

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end

    table = make_table([[table3, table4]], width: 367)

    table.draw
  end

  def table5

    data5 = [[{content: 'Cheltuieli efectuate conform documentelor anexate', colspan: 3}],
             ['Felul actului', 'Nr. si data actului', 'Suma'],
             ['Diurna externa', "#{@payment.days} zile x #{@payment.per_day} EUR", "#{@payment.total} EUR"],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             ['', '', ''],
             [{content: 'TOTAL CHELTUIELI: ', colspan: 2}, "#{@payment.total} EUR"]
    ]
    table5 = make_table(data5, width: 367) do |t|

      t.cells.border_width = 1
      t.cells.style(size: 10, height: 20)
      t.cells[0, 0].style(align: :center, font_style: :bold)
      t.cells[1, 0].style(align: :center)
      t.cells[1, 1].style(align: :center)
      t.cells[1, 2].style(align: :center)
      t.cells[14, 0].style(align: :right, font_style: :bold, size: 12, height: 24)
      t.cells[14, 2].style(align: :center, font_style: :bold, size: 12, height: 24)
      t.rows(2).style(align: :center)

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end

    table5.draw
  end

  def table6

    data6 = [['Diferenta de restituit ', {content: "#{@neg_switch[0]}", inline_format: true}],
             ['s-a depus cu chitanta', {content: "Diferenta de #{'. '*10}<b>#{@payment.rest.abs} EUR</b>#{'. '*20}", inline_format: true}],
             ["nr. #{'. '*5}din #{'. '*5} ", {content: "#{@neg_switch[1]}", inline_format: true}]]

    table = make_table(data6, width: 367) do |t|

      t.cells.border_top_width = 0
      t.cells.border_bottom_width = 0
      t.cells.style(size: 10, height: 20)
      t.cells[0, 1].style(padding: [5, 5, 5, 78])
      t.cells[2, 1].style(padding: [5, 5, 5, 75])

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end

    table.draw
  end

  def table7

    data7 = [[{content: 'Semnatura', rowspan: 2}, 'Se aproba, conducatorul unitatii', 'Controlul financiar preventiv', 'Verificat decont', 'Titular avans'],
             ['', '', '', '']]

    table7 = make_table(data7, width: 367) do |t|

      t.cells.border_width = 1
      t.cells.style(size: 10)
      t.columns(0).width = 80
      t.rows(1).height = 34
      t.cells[0, 0].style(align: :center)
      t.rows(0).columns(1..4).style(align: :center)

      t.before_rendering_page do |page|

        page.row(0).border_top_width = 2
        page.row(-1).border_bottom_width = 2
        page.column(0).border_left_width = 2
        page.column(-1).border_right_width = 2

      end

    end

    table7.draw

  end

  private

  def strike_negative
    a = '<strikethrough>primit</strikethrough>'
    aa = 'primit'
    b = '<strikethrough>restituit</strikethrough>'
    bb = 'restituit'
    @neg_switch = []

    if @payment.rest < 0
      @neg_switch.push a
      @neg_switch.push bb
    else
      @neg_switch.push aa
      @neg_switch.push b
    end
  end

  def generate_number
    if @order_id.nil?
      if Order.last.nil?
        return 1
      else
        Order.last.id.next
      end
    else
      @order_id
    end
  end

end