class Attachment < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true

  mount_uploader :file, FileUploader

  #def make_pdf
    #pdf = ImageToPdf.new(self.attachments)
    #src = File.join(Rails.root, 'tmp/tmp.pdf')
    #pdf.render_file src
    #src_file  = File.new(src)
    #make new Attachement
    #self.attachment.file = pdf
  #end

  #def create_pdf
    #temp_dir  = Rails.root.join('tmp', 'pdf')
    #par = params["attachments_attributes"]
    #logger.debug "THIS IS A TEST: #{self.class}"
  #end

end
