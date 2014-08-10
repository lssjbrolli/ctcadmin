module ApplicationHelper

	def file_uploaded(file)
		if file.file_url.nil?
			'<i class="icon-remove"></i>'
		else
			'<i class="icon-ok"></i>'
		end
	end

	def file_state(file, text)
		if file.file_url.nil?
			button_tag "#{text}", html_options = {disabled: 'disabled', class: 'btn btn-info'}
		else
			link_to "#{text}", file.file_url, html_options = {class: 'btn btn-info'}
		end
	end

	def fullname(user)
		"#{user.first_name.capitalize} #{user.last_name.capitalize}"
	end

	def alert(k, v)
		content_tag :div, class: "alert alert-#{k}" do
			content_tag(:button, 'x', class: 'close', type: 'button', data: {dismiss: 'alert'}) +
					content_tag(:p, v)
		end
	end

	def generate_raport_status(expense, type)
		if expense.empty?
			button_tag 'Generate raport', html_options = {disabled: 'disabled', class: 'btn btn-info'}
		else
			link_to 'Generate raport', make_raport_raports_path(invoice: "#{type}"), method: :post, class: 'btn btn-primary'
		end
	end

	def raport_state(cexpense, type)
		if cexpense.raport_id.nil?
			button_tag 'Raport', html_options = {disabled: 'disabled', class: 'btn btn-info'}
		else
			link_to "Raport nr.#{cexpense.raport_id}", raport_path(Raport.find(cexpense.raport_id), invoice: "#{type}", format: 'pdf'), html_options = {class: 'btn btn-info'}
		end
	end

	def sortable(column, title=nil)
		title     ||= column.titleize
		direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
		link_to title, params.merge(sort: column, direction: direction, page: nil)
	end

end
