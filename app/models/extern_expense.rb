class ExternExpense < ActiveRecord::Base

	acts_as_indexed :fields => [:number]

	mount_uploader :file, FileUploader

	belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'

	CURRENCY    = %w(EUR RON HUF PLN DKK SEK NOK GBP)
	DESCRIPTION = %w(Rent Loan Fuel Cash Service Parts)

	def self.search(search)
		if search && !search.empty?
			ExternExpense.with_query(search)
		else
			ExternExpense.all
		end
	end

end
