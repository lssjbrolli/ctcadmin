module CreditInvoicesHelper

	def sel_currency(cur, value)
		if cur == "RON"
			number_to_currency(value, locale: :ro)
		else
			number_to_currency(value)
		end
	end

	def sel_taxrate(tax, value)
		if tax == "24%"
			number_to_currency(value * 0.24)
		end
	end

end
