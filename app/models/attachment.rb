class Attachment < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true
  belongs_to :created_by, :foreign_key => 'create_id', :class_name => 'User'
  belongs_to :updated_by, :foreign_key => 'update_id', :class_name => 'User'

  mount_uploader :file, FileUploader

end
