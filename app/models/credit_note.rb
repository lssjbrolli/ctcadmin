class CreditNote < ActiveRecord::Base

	#before_update :set_paid

	mount_uploader :file, FileUploader
	
	CURRENCY = ["EUR", "RON"]

	protected

	def set_paid
		self.paid = true	
	end
end
