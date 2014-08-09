class RenameTableCardExpenses < ActiveRecord::Migration
  def change
  	rename_table :card_expenses, :trip_expenses
  end
end
