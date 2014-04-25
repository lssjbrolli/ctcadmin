class CardExpense < ActiveRecord::Base

	#before_save :set_eur

	validates :number, :value, :currency, presence: true

	mount_uploader :file, FileUploader

	CURRENCY = %w(EUR RON HUF PLN DKK SEK NOK)

	#def set_eur
	#	eur = Monetize.parse("#{self.value} #{self.currency}")
	#	eu_bank = EuCentralBank.new
	#	Money.default_bank = eu_bank
	#	eu_bank.update_rates

	#	if self.currency == 'EUR'
	#		self.value_eur = self.value
	#	else
	#		self.value_eur = eu_bank.exchange_with(eur, "EUR")
	#	end
	#end

end
