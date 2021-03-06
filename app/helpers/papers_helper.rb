# frozen_string_literal: true

module PapersHelper
  def expire_row(date)
    today = Time.now.to_date
    return if date.nil?

    diff = (date - today).to_i
    if diff.zero?
      "class='error tip' data-title='This document will expire today.'"
    elsif diff.negative?
      "class='error tip' data-title='This document has expired #{pluralize(diff.abs, 'day')} ago.'"
    elsif diff.positive? && diff <= 7
      "class='error tip' data-title='This document will expire in #{pluralize(diff.abs, 'day')}.'"
    elsif diff > 7 && diff < 30
      "class='warning tip' data-title='This document will expire in #{diff} days.'"
    end
  end

  def path_info(path, action, p)
    if path == 'truck'
      if action == 'edit'
        edit_truck_paper_path(p.document, p)
      else
        truck_paper_path(p.document, p)
      end
    else
      if action == 'edit'
        edit_employee_paper_path(p.document, p)
      else
        employee_paper_path(p.document, p)
      end
    end
  end
end
