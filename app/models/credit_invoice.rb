class CreditInvoice < ActiveRecord::Base

	before_save :set_number, :set_total, :set_paid

	belongs_to :buyer, :foreign_key => 'buyer_id', :class_name => 'Company'
	belongs_to :seller, :foreign_key => 'seller_id', :class_name => 'Company'
	belongs_to :user

	has_many :credit_notes

	accepts_nested_attributes_for :credit_notes

	validates :buyer, :seller, :credit_note_ids, presence: true

	CURRENCY = ["EUR", "RON"]
	VAT_RATE = ["24%", "taxare inversa"]

	protected

	def set_number
		if self.number.empty?
			if CreditInvoice.last.nil?
				self.number = 1
			else				
				self.number = CreditInvoice.last.number.next
			end
		end
	end

	def set_total
		self.net_value = 0
		self.credit_notes.map do |cn|
			self.net_value += cn.value
		end
		if self.tax_rate == "24%"
			self.tax_value = self.net_value * 0.24
			self.total_value = self.net_value + self.tax_value
		else
			self.total_value = self.net_value
		end
	end

	def set_paid
		self.credit_note_ids.each do |cn|
			CreditNote.find(cn).update(paid: true)
		end
	end
end
