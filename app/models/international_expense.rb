class InternationalExpense < ActiveRecord::Base
	mount_uploader :file, FileUploader

	belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'

	CURRENCY = %w(EUR RON HUF PLN DKK SEK NOK GBP)
	DESCRIPTION = %w(Rent Loan Fuel Cash Service Parts)
end
