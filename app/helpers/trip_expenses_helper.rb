module TripExpensesHelper

	def card(cn)
		if cn.card
			'<i class="icon-ok"></i>'
		else
			'<i class="icon-remove"></i>'
		end
	end

end
