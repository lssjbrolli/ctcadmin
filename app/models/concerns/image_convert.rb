module ImageConvert
  extend ActiveSupport::Concern

  def convert
    #create list with attached files
    @files = []
    self.attachments.each { |x| @files << x.file.current_path }
    #check if we have any files to work with
    unless @files.include?(nil) or @files.empty?
      #if the files are images convert them to a pdf
      if self.attachments[0].file.content_type.include?('image')
        image_to_pdf(@files)
        #if the files are pdfs and more than one join them
      elsif self.attachments[0].file.content_type.include?('pdf') && @files.count > 1
        join_pdfs
      end
    end

    CarrierWave.clean_cached_files!
  end

  private

  #use prawn to create pdf from multiple images
  def image_to_pdf(imgs)
    tmp_path = "#{Rails.root}/tmp.pdf"
    pdf = ImageToPdf.new(imgs)
    pdf.render_file(tmp_path)
    self.attachments.destroy_all
    self.attachments.new(file: File.open(tmp_path))
  end

  def join_pdfs
    logger.debug 'INFO: multiple pdfs' # TODO
  end

end