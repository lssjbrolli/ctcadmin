class EditTripExpenses < ActiveRecord::Migration
  def change
    add_column :trip_expenses, :int_id, :integer
    add_column :trip_expenses, :card, :boolean, default: true
  end
end
