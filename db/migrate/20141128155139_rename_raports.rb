# frozen_string_literal: true

class RenameRaports < ActiveRecord::Migration[4.2]
  def change
    rename_column :trip_expenses, :raport, :report
    rename_column :trip_expenses, :raport_id, :report_id
  end
end
