module PapersHelper
	def expire_row(date)
		today = Time.now.to_date
		unless date.nil?
			diff = (date - today).to_i
			if diff <= 7
				"class='error tip' data-title='This document has expired #{diff.abs} days ago.'"
			elsif diff <= 30 && diff > 7
				"class='warning tip' data-title='This document will expire in #{diff} days.'"
			end
		end
	end
end