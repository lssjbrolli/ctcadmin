class CreditInvoice < ActiveRecord::Base

	before_save :set_number

	belongs_to :buyer, :foreign_key => 'buyer_id', :class_name => 'Company'
	belongs_to :seller, :foreign_key => 'seller_id', :class_name => 'Company'

	has_many :credit_notes

	CURRENCY = ["EUR", "RON"]
	VAT_RATE = ["24%", "taxare inversa"]

	protected

	def set_number
		self.number = CreditInvoice.last.number.to_i + 1
	end
end
