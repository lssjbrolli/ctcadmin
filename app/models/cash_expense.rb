class CashExpense < ActiveRecord::Base
	before_save :set_ron

	validates :number, :value, :currency, presence: true

	mount_uploader :file, FileUploader

	CURRENCY = %w(EUR RON HUF PLN DKK SEK NOK)

	def set_ron
		value = Monetize.parse("#{self.value} #{self.currency}")
		eu_bank = EuCentralBank.new
		Money.default_bank = eu_bank
		eu_bank.update_rates

		if self.currency == 'RON'
			self.value_ron = self.value
		else
			self.value_ron = eu_bank.exchange_with(value, "RON")
		end
	end
end
