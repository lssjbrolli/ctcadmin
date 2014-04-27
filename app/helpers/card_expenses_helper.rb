module CardExpensesHelper
	
	def generate_raport_status
		#link_to "Generate raport", "/#", class: "btn btn-primary"
		status = []
		@card_expenses.each { |x| status << x.raport? }

		if status.include?(false)
			link_to "Generate raport", "/#", class: "btn btn-primary"
		else
			button_tag 'Generate raport', html_options = { disabled: "disabled", class: "btn btn-info"}
		end
	end

	def raport_state(file, text)
		if file.raport_id.nil?
			button_tag "#{text}" , html_options = { disabled: "disabled", class: "btn btn-info"}
		else
			link_to "#{text}", Raport.find(file.raport_id).file_url, html_options = { class: "btn btn-info" }
		end
	end

end
