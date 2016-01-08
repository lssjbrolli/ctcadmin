module OrdersHelper

	def gen_order(payment)
		if !payment.diurna
			button_tag "None", html_options = {disabled: 'disabled', class: 'btn btn-warning'}
		else
			if !payment.order.nil?
				@file = payment.order.attachments[0]
				link_to "Show", @file.file_url, class: 'btn btn-info'
			else
				link_to "Generate order", new_order_path(payment), class: 'btn btn-primary', remote: true, data: {toggle: 'modal', target: '#modal', backdrop: 'static'}
			end
		end
	end

	def check_days_in_month(payment)
		payment.days < Time.days_in_month(payment.month.month, payment.month.year)		
	end

end