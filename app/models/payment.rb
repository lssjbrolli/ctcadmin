class Payment < ActiveRecord::Base
	before_save :set_salar_eur
	before_save :set_diurna, :set_rest, if: "self.diurna"

	validates :sron, :month, presence: true

	monetize :salar_ron, :as => "sron", :allow_nil => true, with_currency: :ron
	monetize :salar_eur, :as => "seur", :allow_nil => true, with_currency: :eur

	belongs_to :employee

	DIURNA_BAZA = 1500

	private

	def set_salar_eur
		Money.default_bank.update_rates
		self.seur = self.sron.exchange_to(:eur)
		self.salar_eur = rounding(self.salar_eur)
	end

	def rounding(nr)
		b = nr.to_s

		if b[-2..-1].to_i < 50
			c = nr - b[-2..-1].to_i
		else
			c = nr + 100 - b[-2..-1].to_i
		end
		return c
	end

	def set_diurna
		days  = self.month.end_of_month.day
		self.per_day = ((DIURNA_BAZA.to_f - self.salar_eur/100) / days).round
		self.total = self.per_day * self.days
	end

	def set_rest
		self.rest = self.total - self.avans
	end

end
