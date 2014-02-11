class Expense < ActiveRecord::Base
	
	validates :number, :value, :currency, presence: true

	belongs_to :supplier, :foreign_key => 'supplier_id', :class_name => 'Company'

	mount_uploader :file, FileUploader

	CURRENCY = ["EUR", "RON"]

end
