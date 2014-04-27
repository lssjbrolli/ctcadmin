module ApplicationHelper

	def file_uploaded(file)
		if file.file_url.nil?
			'<i class="icon-remove"></i>'
		else
			'<i class="icon-ok"></i>'
		end
	end 

	def paid(cn)
		if cn.paid
			'<i class="icon-ok"></i>'
		else
			'<i class="icon-remove"></i>'
		end
	end

	def file_state(file, text)
		if file.file_url.nil?
			button_tag "#{text}" , html_options = { disabled: "disabled", class: "btn btn-info"}
		else
			link_to "#{text}", file.file_url, html_options = { class: "btn btn-info" }
		end
	end

	def fullname(user)
		"#{user.first_name.capitalize} #{user.last_name.capitalize}"
	end

	def alert(k, v)
		content_tag :div, class: "alert alert-#{k}" do
			content_tag(:button, "x", class: "close", type: "button", data: {dismiss: "alert"}) +
			content_tag(:p, v)
		end	
	end

end
