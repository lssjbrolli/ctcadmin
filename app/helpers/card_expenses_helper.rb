module CardExpensesHelper
	
	def generate_raport_status
		status = []
		@card_expenses.each { |x| status << x.raport? }

		if status.include?(false)
			link_to "Generate raport", make_raport_raports_path, method: :post, class: "btn btn-primary"
		else
			button_tag 'Generate raport', html_options = { disabled: "disabled", class: "btn btn-info"}
		end
	end

	def raport_state(cexpense)
		if cexpense.raport_id.nil?
			button_tag 'Raport', html_options = { disabled: "disabled", class: "btn btn-info"}
		else
			link_to "Raport nr.#{cexpense.raport_id}", raport_path(Raport.find(cexpense.raport_id), format: "pdf"), html_options = { class: "btn btn-info" }
		end
	end

end
