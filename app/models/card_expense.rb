class CardExpense < ActiveRecord::Base

	validates :number, :value, :currency, presence: true

	mount_uploader :file, FileUploader

	CURRENCY = ["EUR", "RON"]

end
