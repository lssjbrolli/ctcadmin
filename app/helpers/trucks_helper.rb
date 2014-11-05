module TrucksHelper

	def expire_row(date)
		today = Time.now.to_date
		if date.nil?
			'<tr>'
		else
			diff = (date - today).to_i
			if diff <= 7
				"<tr class='error tip' data-title='This document will expire in #{diff} days.'>"
			elsif diff <= 30 && diff > 7
				"<tr class='warning tip' data-title='This document will expire in #{diff} days.'>"
			else
				'<tr>'
			end
		end
	end
end
