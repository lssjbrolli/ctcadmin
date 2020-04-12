# frozen_string_literal: true

class RemoveReportFromTripExp < ActiveRecord::Migration[4.2]
  def change
    remove_column :trip_expenses, :report
  end
end
