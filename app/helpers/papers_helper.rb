module PapersHelper
	def expire_row(date)
		today = Time.now.to_date
		if date.nil?
		else
			diff = (date - today).to_i
			if diff <= 7
				"class='error tip' data-title='This document will expire in #{diff} days.'"
			elsif diff <= 30 && diff > 7
				"class='warning tip' data-title='This document will expire in #{diff} days.'"
			end
		end
	end
end