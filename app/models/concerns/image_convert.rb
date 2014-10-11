module ImageConvert
  extend ActiveSupport::Concern

  def convert
  	@imgs = []
    self.attachments.each {|x| @imgs << x.file.current_path}
  	if self.attachments[0].file.content_type.include?("image")
  	  image_to_pdf(@imgs)
  	elsif self.attachments[0].file.content_type.include?("pdf") && @imgs.count >1
  	  join_pdfs
	end

    CarrierWave.clean_cached_files!
  end

  private

  def image_to_pdf(imgs)
  	tmp_path = "#{Rails.root}/tmp/pdf/tmp.pdf"
    pdf = ImageToPdf.new(imgs)
	pdf.render_file(tmp_path)
	self.attachments.destroy_all
	self.attachments.new(file: File.open(tmp_path))
  end

  def join_pdfs
  	logger.debug "INFO: multiple pdfs"
  end

end