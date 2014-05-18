class CardExpense < ActiveRecord::Base

	validates :number, :value, :value_eur, :date, :currency, presence: true

	mount_uploader :file, FileUploader

	CURRENCY = %w(EUR RON HUF PLN DKK SEK NOK GBP)

end
