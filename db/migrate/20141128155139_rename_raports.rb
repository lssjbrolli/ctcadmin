class RenameRaports < ActiveRecord::Migration
  def change
    rename_column :trip_expenses, :raport, :report
    rename_column :trip_expenses, :raport_id, :report_id
  end
end
