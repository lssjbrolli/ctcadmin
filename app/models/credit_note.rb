class CreditNote < ActiveRecord::Base

	belongs_to :truck
	belongs_to :credit_invoice

	validates :number, presence: true, uniqueness: true
	validates :value, presence: true

	mount_uploader :file, FileUploader
	
	CURRENCY = ["EUR", "RON"]

end
