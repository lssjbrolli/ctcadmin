module CreditNotesHelper

	def truck(cn)
		unless cn.truck.nil?
			cn.truck.registration
		end
	end

end
