class CreditNote < ActiveRecord::Base

	belongs_to :truck
	belongs_to :credit_invoice

	mount_uploader :file, FileUploader
	
	CURRENCY = ["EUR", "RON"]

end
