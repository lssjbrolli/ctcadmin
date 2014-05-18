class Expense < ActiveRecord::Base
	mount_uploader :file, FileUploader

	CURRENCY = %w(EUR RON HUF PLN DKK SEK NOK GBP)
end
