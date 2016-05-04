module PapersHelper
  def expire_row(date)
    today = Time.now.to_date
    unless date.nil?
      diff = (date - today).to_i
      if diff == 0
        "class='error tip' data-title='This document will expire today.'"
      elsif diff < 0
        "class='error tip' data-title='This document has expired #{pluralize(diff.abs, "day")} ago.'"
      elsif diff > 0 && diff <= 7
        "class='error tip' data-title='This document will expire in #{pluralize(diff.abs, "day")}.'"
      elsif diff > 7 && diff < 30
        "class='warning tip' data-title='This document will expire in #{diff} days.'"
      end
    end
  end
end