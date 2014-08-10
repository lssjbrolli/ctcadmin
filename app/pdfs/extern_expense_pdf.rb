class ExternExpensePdf < Prawn::Document
  def initialize(file)
    super()
    @file = file

    container
  end

  def add_image
    image "#{@file}", :width => 610, :height => 790
  end

  def container
    bounding_box([-35, 755], :width => 610, :height => 790) do
      add_image
      transparent(0.5) { stroke_bounds }
    end
  end
end