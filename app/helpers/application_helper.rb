module ApplicationHelper
  def file_uploaded(file)
    @file = file.attachments[0]
    if @file.file_url.nil?
      '<i class="glyphicon glyphicon-remove"></i>'
    else
      '<i class="glyphicon glyphicon-ok"></i>'
    end
  end

  def file_state(file, text)
    @file = file.attachments[0]
    if @file.nil? || @file.file.file.nil?
      button_tag "#{text}", html_options = { disabled: 'disabled', class: 'btn btn-info' }
    else
      link_to "#{text}", @file.file_url, html_options = { class: 'btn btn-info' }
    end
  end

  def fullname(user)
    "#{user.first_name.capitalize} #{user.last_name.capitalize}"
  end

  def alert(k, v)
    content_tag :div, class: "alert alert-#{k}" do
      content_tag(:button, 'x', class: 'close', type: 'button', data: { dismiss: 'alert' }) +
        content_tag(:p, v)
    end
  end

  def check_mounted
    !ENV['AWS_ACCESS_KEY_ID'].empty? || ENV['AWS_ACCESS_KEY_ID'].empty? && File.file?("#{Rails.root}/public/uploads/mounted")
  end
end
