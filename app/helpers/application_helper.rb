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

	def fullname(user)
		"#{user.first_name} #{user.last_name}"
	end

end
