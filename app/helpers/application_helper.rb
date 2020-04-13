# frozen_string_literal: true

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
      button_tag(text.to_s, { disabled: 'disabled', class: 'btn btn-info' })
    else
      link_to(text.to_s, @file.file_url, { class: 'btn btn-info' })
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
    File.file?("#{Rails.root}/public/uploads/mounted")
  end
end
