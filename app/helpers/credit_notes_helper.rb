module CreditNotesHelper

	def truck(cn)
		unless cn.truck.nil?
			cn.truck.registration
		end
	end

	def paid(cn)
		if cn.paid
			'<i class="icon-ok"></i>'
		else
			'<i class="icon-remove"></i>'
		end
	end

end
