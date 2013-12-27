class CreditInvoice < ActiveRecord::Base

	before_save :set_number, :set_total, :set_paid

	belongs_to :buyer, :foreign_key => 'buyer_id', :class_name => 'Company'
	belongs_to :seller, :foreign_key => 'seller_id', :class_name => 'Company'

	has_many :credit_notes

	accepts_nested_attributes_for :credit_notes

	CURRENCY = ["EUR", "RON"]
	VAT_RATE = ["24%", "taxare inversa"]

	protected

	def set_number
		self.number = CreditInvoice.last.number.to_i + 1
	end

	def set_total
		self.value = 0
		if self.tax_rate == "24%"
			self.credit_note_ids.each do |cn|
				self.value += CreditNote.find(cn).value
			end
			self.value = self.value * 1.24
		else
			self.credit_note_ids.each do |cn|
				self.value += CreditNote.find(cn).value
			end
		end

	end

	def set_paid
		self.credit_note_ids.each do |cn|
			CreditNote.find(cn).update(paid: true)
		end
	end
end
