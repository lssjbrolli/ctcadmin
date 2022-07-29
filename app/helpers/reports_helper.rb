# frozen_string_literal: true

module ReportsHelper
  def report_state(expense)
    if expense.report_id?
      link_to "Report nr.#{expense.report_id}", report_path(expense.report_id), class: 'btn btn-info'
    else
      button_tag 'Report', { disabled: 'disabled', class: 'btn btn-info' }
    end
  end

  def generate_report_status(expense)
    if expense.empty?
      button_tag 'Generate report', { disabled: 'disabled', class: 'btn btn-info' }
    else
      link_to 'Generate report', make_report_path, method: :post, class: 'btn btn-primary'
    end
  end
end
