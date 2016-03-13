module OrdersHelper

	def gen_order(payment)
		if !payment.diurna
			button_tag "None", html_options = {disabled: 'disabled', class: 'btn btn-warning payment-btn'}
		else
			if payment.updated?
				link_to "Regenerate order", new_order_path(payment), class: 'btn btn-danger payment-btn', remote: true, data: {toggle: 'modal', target: '#modal', backdrop: 'static'}
			elsif !payment.order.nil?
				@file = payment.order.attachments[0]
				link_to "Show", @file.file_url, class: 'btn btn-info payment-btn'
			else
				link_to "Generate order", new_order_path(payment), class: 'btn btn-primary payment-btn', remote: true, data: {toggle: 'modal', target: '#modal', backdrop: 'static'}
			end
		end
	end

	def check_days_in_month(payment)
		payment.days < Time.days_in_month(payment.month.month, payment.month.year)		
	end

end