class RemoveReportFromTripExp < ActiveRecord::Migration
  def change
  	remove_column :trip_expenses, :report
  end
end
