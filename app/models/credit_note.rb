class CreditNote < ActiveRecord::Base

	mount_uploader :file, FileUploader
end
