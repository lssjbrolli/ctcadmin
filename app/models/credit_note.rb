class CreditNote < ActiveRecord::Base

	mount_uploader :file, FileUploader
	
	CURRENCY = ["EUR", "RON"]
end
